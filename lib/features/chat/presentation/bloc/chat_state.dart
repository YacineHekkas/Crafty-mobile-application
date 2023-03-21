part of 'chat_bloc.dart';

abstract class ChatState {}

class LoadingConversationsState extends ChatState {}

class LoadConversationsCompletedState extends ChatState {
  late List<Conversation> convs;

  LoadConversationsCompletedState({required this.convs});
}

class LoadMessagesCompletedState extends ChatState {
  late List<Message> msgs;

  LoadMessagesCompletedState({required this.msgs});
}

