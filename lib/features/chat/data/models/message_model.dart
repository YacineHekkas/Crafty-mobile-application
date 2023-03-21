class Message {
  Message({
    required this.id,
    required this.body,
    required this.isSender,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String body;
  bool isSender;
  bool seen;
  DateTime createdAt;
  DateTime updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["_id"],
    body: json["body"],
    isSender: json["isSender"],
    seen: json["seen"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );
}