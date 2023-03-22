part of 'chat_bloc.dart';

abstract class ChatEvent {}

class LoadConversationsEvent extends ChatEvent {
  final bool forceNetworkFetch;

  LoadConversationsEvent({ this.forceNetworkFetch = false });
}

class LoadConversationsCompletedEvent extends ChatEvent {
  late List<Conversation> convs;

  LoadConversationsCompletedEvent({required this.convs});
}

class LoadMessagesEvent extends ChatEvent {
  final String id;
  final bool forceNetworkFetch;

  LoadMessagesEvent({ required this.id, this.forceNetworkFetch = false });
}
