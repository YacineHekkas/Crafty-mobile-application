part of 'chat_bloc.dart';

abstract class ChatEvent {}

class LoadConversationsEvent extends ChatEvent {}
class LoadMessagesEvent extends ChatEvent {
  late String id;

  LoadMessagesEvent({ required this.id });
}
