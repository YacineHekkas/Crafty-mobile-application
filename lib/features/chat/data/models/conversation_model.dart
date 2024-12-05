import 'package:cp_project/features/chat/data/models/message_model.dart';

class Conversation {
  Conversation({
    required this.id,
    required this.seen,
    required this.lastMessage,
    required this.receiverUser,
    required this.messagesCount,
  });

  String id;
  bool seen;
  int messagesCount;
  Message? lastMessage;
  ReceiverUser receiverUser;

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["_id"],
        seen: json["seen"],
        messagesCount: json['messages']['count'],
        lastMessage: json["lastMessage"] != null ? Message.fromJson(json["lastMessage"]) : null,
        receiverUser: ReceiverUser.fromJson(json["receiverUser"]),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'seen': seen,
        'messages': {'count': messagesCount},
        'lastMessage': lastMessage?.toJson(),
        'receiverUser': receiverUser.toJson(),
      };
}

class ReceiverUser {
  ReceiverUser({
    required this.avatar,
    required this.name,
    required this.online,
    required this.lastOnline,
    required this.id,
  });

  String avatar;
  String name;
  String id;
  bool online;
  DateTime? lastOnline;

  factory ReceiverUser.fromJson(Map<String, dynamic> json) => ReceiverUser(
        id: json['_id'],
        avatar: json['avatar']['url'],
        online: json['online'],
        lastOnline: json['lastOnline'] != null
            ? DateTime.parse(json['lastOnline']).toLocal()
            : null,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'avatar': {'url': avatar},
        'online': online,
        'lastOnline': lastOnline?.toString(),
        'name': name
      };
}
