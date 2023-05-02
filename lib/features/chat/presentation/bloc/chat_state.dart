part of 'chat_bloc.dart';

enum ChatStatus {
  initial,
  fetchConversations,
  fetchMessages,
  checkConnection,
  messageOperation
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  error,
  seen,
  typing,
  none,
  edit,
  remove
}

enum ChatResult { pending, success, failure }

class ChatState extends Equatable {
  const ChatState({
    this.status = ChatStatus.initial,
    this.result = ChatResult.pending,
    this.conversations = const <Conversation>[],
    this.isConnected = true,
    this.conversationsPageInfo =
        const PaginationInfo(page: 1, hasNextPage: true),
  });

  final ChatStatus status;
  final ChatResult result;
  final List<Conversation> conversations;
  final PaginationInfo conversationsPageInfo; // TODO: add copyWith
  final bool isConnected;

  ChatState copyWith(
          {ChatStatus? status,
          ChatResult? result,
          List<Conversation>? conversations,
          PaginationInfo? conversationsPageInfo,
          bool? isConnected}) =>
      ChatState(
        status: status ?? this.status,
        result: result ?? this.result,
        conversations: conversations ?? this.conversations,
        conversationsPageInfo:
            conversationsPageInfo ?? this.conversationsPageInfo,
        isConnected: isConnected ?? this.isConnected,
      );

  factory ChatState.fromJson(Map<String, dynamic> json) => ChatState(
        status: ChatStatus.values[json['status']],
        result: ChatResult.values[json['result']],
        conversations: List<Conversation>.from(
            json['conversations'].map((c) => Conversation.fromJson(c))),
        conversationsPageInfo:
            PaginationInfo.fromJson(json['conversationsPageInfo']),
      );

  Map<String, dynamic> toJson() => {
        'status': status.index,
        'result': result.index,
        'conversations': conversations.map((c) => c.toJson()).toList(),
        'conversationsPageInfo': conversationsPageInfo.toJson(),
      };

  @override
  List<Object?> get props =>
      [status, result, conversations, conversationsPageInfo, isConnected];
}

class ChatMessagesSate extends Equatable {
  const ChatMessagesSate({
    this.status = ChatStatus.initial,
    this.result = ChatResult.pending,
    this.messages = const <Message>[],
    this.pendingMessages = const <Message>[],
    this.isConnected = true,
    this.messageID,
    this.messageNewID,
    this.messageStatus,
    this.messagesPageInfo = const PaginationInfo(page: 1, hasNextPage: true),
  });

  final ChatStatus status;
  final ChatResult result;

  final List<Message> messages;
  final List<Message> pendingMessages;
  final PaginationInfo messagesPageInfo;

  final String? messageID;
  final String? messageNewID;

  final MessageStatus? messageStatus;

  final bool isConnected;

  List<Message> get getMessages => List.of(pendingMessages.reversed)
    ..removeWhere((e) => messages.any((m) => e.id == m.id))
    ..addAll(messages);

  Message getMessage(String id) => getMessages.firstWhere((e) => e.id == id);

  ChatMessagesSate copyWith({
    ChatStatus? status,
    ChatResult? result,
    List<Message>? messages,
    List<Message>? pendingMessages,
    PaginationInfo? messagesPageInfo,
    String? messageID,
    String? messageNewID,
    MessageStatus? messageStatus,
    bool? isConnected,
  }) =>
      ChatMessagesSate(
        status: status ?? this.status,
        result: result ?? this.result,
        messages: messages ?? this.messages,
        pendingMessages: pendingMessages ?? this.pendingMessages,
        messagesPageInfo: messagesPageInfo ?? this.messagesPageInfo,
        messageStatus: messageStatus ?? this.messageStatus,
        messageID: messageID ?? this.messageID,
        messageNewID: messageNewID ?? this.messageNewID,
        isConnected: isConnected ?? this.isConnected,
      );

  factory ChatMessagesSate.fromJson(Map<String, dynamic> json) =>
      ChatMessagesSate(
        status: ChatStatus.values[json['status']],
        result: ChatResult.values[json['result']],
        messages: List<Message>.from(
            json['messages'].map((c) => Message.fromJson(c))),
        pendingMessages: List<Message>.from(
            json['pendingMessages'].map((c) => Message.fromJson(c))),
        messagesPageInfo: PaginationInfo.fromJson(json['messagesPageInfo']),
      );

  Map<String, dynamic> toJson() => {
        'status': status.index,
        'result': result.index,
        'messages': messages.map((c) => c.toJson()).toList(),
        'pendingMessages': List.of(pendingMessages)
          ..removeWhere((e) =>
              e.status == MessageStatus.error ||
              e.body.isEmpty &&
                  e.attachments == null &&
                  e.localAttchmentsList == null)
          ..map((c) => c.toJson()).toList(),
        'messagesPageInfo': messagesPageInfo.toJson(),
      };

  @override
  List<Object?> get props => [
        status,
        result,
        messages,
        pendingMessages,
        messagesPageInfo,
        messageID,
        messageNewID,
        messageStatus,
        isConnected
      ];
}
