import 'package:cp_project/features/chat/data/models/conversation_model.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';

abstract class ChatSource {
  Future<List<Conversation>> getConversations();
  Future<List<Message>> getMessages(String id);
  Future<String> sendMessage(String id, String body);
  Future<String> seenMessage(String id);
}