import 'dart:developer';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/models/conversation_model.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:cp_project/injection_container.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(LoadingConversationsState()) {
    on<ChatEvent>((event, emit) async {
      final src = locator<ChatSource>();
      if (event is LoadConversationsEvent) {
        try {
          final list = await src.getConversations(forceNetworkFetch: event.forceNetworkFetch);

          emit(LoadConversationsCompletedState(convs: list));
        } catch (e) {
          log('$e');
        }
      } else if (event is LoadMessagesEvent) {
        try {
          final list = await src.getMessages(event.id, forceNetworkFetch: event.forceNetworkFetch);

          emit(LoadMessagesCompletedState(msgs: list));
        } catch (e) {
          log('$e');
        }
      } else if (event is LoadConversationsCompletedEvent) {
        emit(LoadConversationsCompletedState(convs: event.convs));
      }
    });
  }
}
