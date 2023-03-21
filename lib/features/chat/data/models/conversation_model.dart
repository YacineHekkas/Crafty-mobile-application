import 'package:cp_project/features/chat/data/models/message_model.dart';

class Conversation {
  Conversation({
    required this.id,
    required this.seen,
    required this.lastMessage,
    required this.receiverUser,
  });

  String id;
  bool seen;
  Message lastMessage;
  ReceiverUser receiverUser;

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
      id: json["_id"],
      seen: json["seen"],
      lastMessage: Message.fromJson(json["lastMessage"]),
      receiverUser: ReceiverUser.fromJson(json["receiverUser"]),
  );
}

class ReceiverUser {
  ReceiverUser({
    required this.name,
    required this.id
  });

  String name;
  String id;

  factory ReceiverUser.fromJson(Map<String, dynamic> json) => ReceiverUser(
      name: json["name"],
      id: json['_id']
  );
}