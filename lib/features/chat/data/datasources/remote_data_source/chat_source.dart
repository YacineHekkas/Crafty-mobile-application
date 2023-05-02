import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/chat/data/models/conversation_model.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:equatable/equatable.dart';

class PaginationInfo extends Equatable {
  final int page;
  final bool hasNextPage;

  const PaginationInfo({required this.page, required this.hasNextPage});

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        page: json['currentPage'],
        hasNextPage: json['hasNextPage'],
      );

  Map<String, dynamic> toJson() =>
      {'currentPage': page, 'hasNextPage': hasNextPage};

  @override
  List<Object> get props => [page, hasNextPage];
}

class Pagination<T> extends Equatable {
  final T data;
  final PaginationInfo pageInfo;

  const Pagination({required this.data, required this.pageInfo});

  @override
  List<Object?> get props => [data, pageInfo];
}

abstract class ChatSource {
  Server get server;

  Future<Pagination<List<Conversation>>> getConversations({
    int page,
    int perPage,
    bool cacheFetch,
    bool forceNetworkFetch,
  });
  Future<Pagination<List<Message>>> getMessages(
    String id, {
    int page,
    int perPage,
    bool cacheFetch,
    bool forceNetworkFetch,
  });

  Future<String> sendMessage(
    String id,
    String body, {
    Attachments? attachments,
  });
  Future<String> seenMessage(String id);
  Future<String> typeMessage(String id, bool typing);
  Future<String> editMessage(String id, String body);
  Future<bool> deleteConversation(String id);
  Future<String> deleteMessage(String id);
  Future<String?> uploadImage(
    String id,
    String path, {
    String? mimeType,
    void Function(int, int)? callback,
  });
}
