import 'package:cp_project/core/error/exceptions.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/models/conversation_model.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';

class ChatSourceImpl implements ChatSource {
  late Server server;

  ChatSourceImpl({required this.server});

  @override
  Future<List<Conversation>> getConversations({ bool forceNetworkFetch = false }) async {
    final res = await server.fetchData(
      '''query FetchUser(\$limit: Int, \$sort: SortFindManyConversationInput) {
          fetchUser {
            conservations(limit: \$limit, sort: \$sort) {
              _id
              seen
              lastMessage {
                _id
                body
                isSender
                seen
                createdAt
                updatedAt
              }
              receiverUser {
                _id
                name
              }
            }
          }
        }
      ''', { 'limit': 100, 'sort': 'UPDATEDAT_DESC' }, cacheFetch: false, forceNetworkFetch: forceNetworkFetch);

    if (res.data == null || res.exception != null || res.data!['fetchUser'] == null) {
      throw ServerException;
    }

    return List<Conversation>.from(res.data!['fetchUser']['conservations'].map((x) => Conversation.fromJson(x)));
  }

  @override
  Future<List<Message>> getMessages(String id, { bool forceNetworkFetch = false }) async {
    final res = await server.fetchData(
      '''query FetchMessages(\$id: MongoID!, \$limit: Int, \$skip: Int) {
          fetchMessages(id: \$id, limit: \$limit, skip: \$skip) {
            _id
            body
            isSender
            seen
            createdAt
            updatedAt
          }
        }
      ''', { 'id': id, 'limit': 1000}, cacheFetch: false, forceNetworkFetch: forceNetworkFetch);

    if (res.data == null || res.exception != null || res.data!['fetchMessages'] == null) {
      throw ServerException;
    }

    return List<Message>.from(res.data!['fetchMessages'].map((x) => Message.fromJson(x)));
  }

  @override
  Future<String> sendMessage(String id, String body) async {
    final res = await server.postData(
      '''mutation SendMessage(\$receiver: MongoID!, \$body: String!) {
          sendMessage(receiver: \$receiver, body: \$body) {
            _id
          }
        }
      ''', { 'receiver': id, 'body': body });

    if (res.data == null || res.exception != null || res.data!['sendMessage'] == null) {
      throw ServerException;
    }

    return res.data!['sendMessage']['_id'];
  }

  @override
  Future<String> seenMessage(String id) async {
    final res = await server.postData(
      '''query SeenMessage(\$id: MongoID!) {
          seenMessage(id: \$id) {
            _id
          }
        }
      ''', { 'id': id });

    if (res.data == null || res.exception != null || res.data!['seenMessage'] == null) {
      throw ServerException;
    }

    return res.data!['seenMessage']['_id'];
  }
}