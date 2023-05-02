part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  final ChatStatus? status;
  final ChatResult? result;
  final int page;
  final List<Conversation>? conversations;
  final List<Message>? messages;
  final PaginationInfo? conversationsPageInfo; // TODO: add copyWith
  final PaginationInfo? messagesPageInfo;
  final bool forceNetworkFetch;
  final bool forceRefresh;

  const ChatEvent({this.page = 1, this.conversations, this.messages, this.conversationsPageInfo, this.messagesPageInfo, this.status, this.result, this.forceRefresh = false, this.forceNetworkFetch = false });

  @override
  List<Object?> get props => [status, result, page, conversations, messages, conversationsPageInfo, messagesPageInfo, forceRefresh, forceNetworkFetch];
}

class ChatEventAddable extends ChatEvent {
  final Message? pendingMessage;
  final bool? isConnected;

  const ChatEventAddable({this.pendingMessage, this.isConnected, super.page = 1, super.conversations, super.messages, super.conversationsPageInfo, super.messagesPageInfo, super.status, super.result, super.forceRefresh = false, super.forceNetworkFetch = false });

  @override
  List<Object?> get props => [pendingMessage, isConnected, ...super.props];
}

class FetchConversations extends ChatEvent {
  const FetchConversations({super.page, super.conversations, super.forceRefresh, super.forceNetworkFetch});
}

class FetchMessages extends ChatEvent {
  final String id;

  const FetchMessages(this.id, {super.page, super.messages, super.forceRefresh, super.forceNetworkFetch});

  @override
  List<Object?> get props => [id, ...super.props];
}

class UpdateMessage extends ChatEvent {
  // TODO: ugly, chnage this
  final String? id;
  final String? newId;
  final String? body;
  final MessageStatus messageStatus;
  final Attachments? attachments;

  const UpdateMessage(this.messageStatus, {super.result, this.attachments, this.body, this.id, this.newId});

  @override
  List<Object?> get props => [id, newId, messageStatus, attachments, body, ...super.props];
}