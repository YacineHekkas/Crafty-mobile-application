import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';

class Message {
  Message({
    required this.id,
    required this.body,
    required this.isSender,
    required this.seen,
    required this.deleted,
    required this.createdAt,
    this.seenAt,
    this.editAt,
    this.attachments,
    this.localAttchmentsList,
    this.delAt,
    this.status = MessageStatus.delivered,
  });

  String id;
  String body;
  bool isSender;
  bool seen;
  bool deleted;
  DateTime createdAt;
  DateTime? seenAt;
  DateTime? editAt;
  DateTime? delAt;
  Attachments? attachments;
  List<AssetEntity>? localAttchmentsList;
  MessageStatus status;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      id: json["_id"],
      body: json["body"],
      isSender: json["isSender"],
      seen: json["seen"],
      deleted: json["deleted"],
      createdAt: DateTime.parse(json["createdAt"]).toLocal(),
      seenAt: json["seenAt"] != null
          ? DateTime.parse(json["seenAt"]).toLocal()
          : null,
      editAt: json["editAt"] != null
          ? DateTime.parse(json["editAt"]).toLocal()
          : null,
      delAt: json["delAt"] != null
          ? DateTime.parse(json["delAt"]).toLocal()
          : null,
      attachments: json['attachments'] != null
          ? Attachments.fromJson(json['attachments'])
          : null,
      status: json['status'] != null
          ? MessageStatus.values[json['status']]
          : MessageStatus.delivered);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'body': body,
        'isSender': isSender,
        'seen': seen,
        'deleted': deleted,
        'createdAt': createdAt.toString(),
        'seenAt': seenAt?.toString(),
        'editAt': editAt?.toString(),
        'delAt': delAt?.toString(),
        'attachments': attachments != null ? attachments!.toJson() : null,
        'status': status.index
      };
}

class Attachments {
  Attachments({this.images});

  final List<String>? images;

  factory Attachments.fromJson(Map<String, dynamic> json) => Attachments(
      images: json['images'] != null
          ? List<String>.from(json['images'].map((x) => x['url']))
          : null);

  Map<String, dynamic> toJson() => {
        "images": images != null
            ? List<Map<String, dynamic>>.from(images!.map((x) => {'url': x}))
            : null,
      };
}
