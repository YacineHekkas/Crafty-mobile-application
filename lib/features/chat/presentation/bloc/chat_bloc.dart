import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/models/conversation_model.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:cp_project/features/chat/presentation/widgets/message.dart';
import 'package:cp_project/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'chat_event.dart';
part 'chat_state.dart';

const throttleDuration = Duration(milliseconds: 200);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ChatBloc extends HydratedBloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<FetchConversations>(_onConversationFetch,
        transformer: throttleDroppable(throttleDuration));
    on<ChatEventAddable>(
      (event, emit) => emit(
        state.copyWith(
            status: event.status,
            result: event.result,
            conversations: event.conversations,
            conversationsPageInfo: event.conversationsPageInfo,
            isConnected: event.isConnected),
      ),
    );
  }

  Future<void> _onConversationFetch(
      FetchConversations event, Emitter<ChatState> emit) async {
    if (!event.forceRefresh && !state.conversationsPageInfo.hasNextPage) return;

    try {
      final data = locator<ChatSource>();
      final pagination = await data.getConversations(
        page: event.forceRefresh ? 1 : event.page,
        cacheFetch: !event.forceNetworkFetch && !event.forceRefresh,
        forceNetworkFetch: event.forceNetworkFetch,
      );
      print("---------------------------->..>$pagination");

      emit(
        state.copyWith(
          status: ChatStatus.fetchConversations,
          result: ChatResult.success,
          conversations: event.forceRefresh
              ? pagination.data
              : (List.of(state.conversations)..addAll(pagination.data)),
          conversationsPageInfo: pagination.pageInfo,
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);
      emit(state.copyWith(
          status: ChatStatus.fetchConversations, result: ChatResult.failure));
    }
  }

  @override
  ChatState? fromJson(Map<String, dynamic> json) => ChatState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ChatState state) => state.toJson();
}

class ChatMessagesBloc extends HydratedBloc<ChatEvent, ChatMessagesSate> {
  final String instance;
  final data = locator<ChatSource>();

  ChatMessagesBloc({required this.instance}) : super(const ChatMessagesSate()) {
    on<FetchMessages>(_onMessageFetch,
        transformer: throttleDroppable(throttleDuration));
    on<UpdateMessage>(_onUpdateMessage);
    on<ChatEventAddable>((event, emit) {
      emit(
        state.copyWith(
          status: event.status,
          result: event.result,
          messages: event.messages,
          pendingMessages: event.pendingMessage != null
              ? (List.of(state.pendingMessages)..add(event.pendingMessage!))
              : null,
          messagesPageInfo: event.messagesPageInfo,
          isConnected: event.isConnected,
          isChatOpen: event.isChatOpen
        ),
      );
    });
  }

  Future<void> _onMessageFetch(
      FetchMessages event, Emitter<ChatMessagesSate> emit) async {
    if (!event.forceRefresh && !state.messagesPageInfo.hasNextPage) return;

    try {
      final messages = List.of(state.messages);
      final pagination = await data.getMessages(
        event.id,
        page: event.forceRefresh ? 1 : event.page,
        cacheFetch: !event.forceNetworkFetch && !event.forceRefresh,
        forceNetworkFetch: event.forceNetworkFetch,
      );
      final pendingMessages = List.of(state.pendingMessages);
      if (pendingMessages.isNotEmpty) {
        pendingMessages.removeWhere(
          (e) =>
              messages.any((m) => e.id == m.id) ||
              e.status == MessageStatus.error,
        );
      }

      emit(state.copyWith(
        status: ChatStatus.fetchMessages,
        result: ChatResult.success,
        messages: event.forceRefresh
            ? pagination.data
            : (messages..addAll(pagination.data)),
        pendingMessages: pendingMessages,
        messagesPageInfo: pagination.pageInfo,
      ));
    } catch (e, s) {
      print(e);
      print(s);

      emit(state.copyWith(
          status: ChatStatus.fetchMessages, result: ChatResult.failure));
    }
  }

  Future<void> _onUpdateMessage(
      UpdateMessage event, Emitter<ChatMessagesSate> emit) async {
      /* TODO: add history support */
      /* TODO: ugly code, change it */
      final failure = event.result == ChatResult.failure;
      final now = !failure ? DateTime.now() : null;
      List<Message>? messages;
      List<Message>? pendingMessages;

      if (event.messageStatus == MessageStatus.typing ||
          event.messageStatus == MessageStatus.none) {
        return emit(
          state.copyWith(
            status: ChatStatus.messageOperation,
            messageStatus: event.messageStatus,
          ),
        );
      }

      var index =
          state.messages.indexWhere((element) => element.id == event.id);

      if (index == -1)
        print('messagesBloc-$id: ${event.id} not found in state messages');

      if (index != -1 &&
          (event.messageStatus == MessageStatus.seen ||
              event.messageStatus == MessageStatus.edit ||
              event.messageStatus == MessageStatus.remove)) {
        messages = List.of(state.messages);

        if (event.messageStatus == MessageStatus.edit) {
          messages[index].body = event.body!;
          messages[index].editAt = now;
        } else if (event.messageStatus == MessageStatus.remove) {
          messages[index].deleted = !failure;
          messages[index].delAt = now;
        } else if (event.messageStatus == MessageStatus.seen) {
          if (!messages[index].isSender) {
            data.seenMessage(event.id!);
          }

          messages[index].seen = true;
          messages[index].seenAt = now;
        }

        messages[index].status = event.messageStatus;
      }

      index =
          state.pendingMessages.indexWhere((element) => element.id == event.id);

      if (index == -1)
        print(
            'messagesBloc-$id: ${event.id} not found in state pendingMessages');

      if (index != -1) {
        pendingMessages = List.of(state.pendingMessages);

        if (event.newId != null) {
          pendingMessages[index].id = event.newId!;
        }

        if (event.messageStatus == MessageStatus.edit) {
          pendingMessages[index].body = event.body!;
          pendingMessages[index].editAt = now;
        } else if (event.messageStatus == MessageStatus.remove) {
          pendingMessages[index].deleted = !failure;
          pendingMessages[index].delAt = now;
        } else if (event.messageStatus == MessageStatus.seen) {
          pendingMessages[index].seen = true;
          pendingMessages[index].seenAt = now;
        }

        pendingMessages[index].status = event.messageStatus;
        pendingMessages[index].attachments = event.attachments;
        if (event.attachments != null) {
          pendingMessages[index].localAttchmentsList = null;
        }
      }
      emit(
        state.copyWith(
          status: ChatStatus.messageOperation,
          result: ChatResult.success,
          messageID: event.id,
          messageStatus: event.messageStatus,
          messageNewID: event.newId,
          messages: messages,
          pendingMessages: pendingMessages,
        ),
      );
  }

  @override
  String get id => instance;

  @override
  void onTransition(Transition<ChatEvent, ChatMessagesSate> transition) {
    super.onTransition(transition);

    print(
        'ChatMessagesBloc-${id.substring(0, 8)} ${transition.currentState} >> ${transition.event} >> ${transition.nextState}');
  }

  @override
  void onEvent(ChatEvent event) {
    super.onEvent(event);

    print('ChatMessagesBloc-${id.substring(0, 8)} $event');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('ChatMessagesBloc-${id.substring(0, 8)} $error $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  ChatMessagesSate? fromJson(Map<String, dynamic> json) =>
      ChatMessagesSate.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ChatMessagesSate state) => state.toJson();
}
