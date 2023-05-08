import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cp_project/core/error/exceptions.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/models/conversation_model.dart';
import 'package:cp_project/features/chat/data/models/message_model.dart';
import 'package:cp_project/injection_container.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class ChatSourceImpl implements ChatSource {
  @override
  final Server server;

  ChatSourceImpl({required this.server});

  @override
  Future<Pagination<List<Conversation>>> getConversations({
    int page = 1,
    int perPage = 16,
    bool cacheFetch = true,
    bool forceNetworkFetch = false,
  }) async {
    final res = await server.fetchData(
      '''query FetchUser(\$page: Int, \$perPage: Int, \$sort: SortFindManyConversationInput) {
          fetchUser {
            conservations(page: \$page, perPage: \$perPage, sort: \$sort) {
              pageInfo {
                currentPage
                hasNextPage
              }
              items {
                _id
                seen
                lastMessage {
                  _id
                  body
                  isSender
                  seen
                  deleted
                  createdAt
                }
                messages {
                  count
                }
                receiverUser {
                  _id
                  avatar {
                    url
                  }
                  name
                  online
                  createdAt
                  updatedAt
                  lastOnline
                }
              }
            }
          }
        }
      ''',
      vars: {'sort': 'UPDATEDAT_DESC', 'perPage': perPage, 'page': page},
      cacheFetch: cacheFetch,
      forceNetworkFetch: forceNetworkFetch,
    );

    print(res);
    if (res.data == null ||
        res.exception != null ||
        res.data!['fetchUser'] == null) {
      throw ServerException;
    }

    return Pagination(
      data: List<Conversation>.from(res
          .data!['fetchUser']!['conservations']!['items']
          .map((x) => Conversation.fromJson(x))).toList()
        ..removeWhere((e) => e.messagesCount <= 0),
      pageInfo: PaginationInfo.fromJson(
          res.data!['fetchUser']!['conservations']!['pageInfo']!),
    );
  }

  @override
  Future<Pagination<List<Message>>> getMessages(
    String id, {
    int page = 1,
    int perPage = 20,
    bool cacheFetch = true,
    bool forceNetworkFetch = false,
  }) async {
    final res = await server.fetchData(
      '''query FetchMessages(\$id: MongoID!, \$page: Int, \$perPage: Int, \$sort: SortFindManyMessageInput) {
          fetchMessages(id: \$id, page: \$page, perPage: \$perPage, sort: \$sort) {
            pageInfo {
              currentPage
              hasNextPage
            }
            items {
              _id
              body
              isSender
              seen
              seenAt
              deleted
              editAt
              delAt
              createdAt
              attachments {
                images {
                  url
                }
              }
            }
          }
          }
      ''',
      vars: {
        'id': id,
        'sort': 'CREATEDAT_DESC',
        'perPage': perPage,
        'page': page
      },
      cacheFetch: cacheFetch,
      forceNetworkFetch: forceNetworkFetch,
    );

    if (res.data == null ||
        res.exception != null ||
        res.data!['fetchMessages'] == null) {
      print(res);

      throw ServerException;
    }

    return Pagination(
        data: List<Message>.from(res.data!['fetchMessages']['items']
            .map((x) => Message.fromJson(x))),
        pageInfo:
            PaginationInfo.fromJson(res.data!['fetchMessages']['pageInfo']));
  }

  @override
  Future<String> sendMessage(String id, String body,
      {Attachments? attachments}) async {
    final res = await server.postData(
        '''mutation SendMessage(\$receiver: MongoID!, \$body: String!, \$attachments: MessageAttachmentsInput) {
          sendMessage(receiver: \$receiver, body: \$body, attachments: \$attachments) {
            _id
          }
        }
      ''',
        {'receiver': id, 'body': body, 'attachments': attachments?.toJson()});

    if (res.data == null ||
        res.exception != null ||
        res.data!['sendMessage'] == null) {
      throw ServerException;
    }

    return res.data!['sendMessage']['_id'];
  }

  @override
  Future<String> seenMessage(String id) async {
    final res = await server.postData('''query SeenMessage(\$id: MongoID!) {
          seenMessage(id: \$id) {
            _id
          }
        }
      ''', {'id': id});

    if (res.data == null ||
        res.exception != null ||
        res.data!['seenMessage'] == null) {
      print(res);
      throw ServerException;
    }

    return res.data!['seenMessage']['_id'];
  }

  @override
  Future<String> typeMessage(String id, bool typing) async {
    final res = await server.postData('''
      mutation TypeMessage(\$id: MongoID!, \$typing: Boolean!) {
        typeMessage(id: \$id, typing: \$typing) {
          conversation
        }
      }
      ''', {'id': id, 'typing': typing});

    if (res.data == null ||
        res.exception != null ||
        res.data!['typeMessage'] == null) {
      throw ServerException;
    }

    return res.data!['typeMessage']['conversation'];
  }

  @override
  Future<bool> deleteConversation(String id) async {
    final res = await server.postData('''
      mutation DeleteConversation(\$id: MongoID!) {
        deleteConversation(id: \$id)
      }
      ''', {'id': id});

    if (res.data == null ||
        res.exception != null ||
        res.data!['deleteConversation'] == null) {
      throw ServerException;
    }

    return res.data!['deleteConversation'];
  }

  @override
  Future<String> deleteMessage(String id) async {
    final res = await server.postData('''
      mutation DeleteMessage(\$id: MongoID!) {
        deleteMessage(id: \$id) {
          _id
        }
      }
      ''', {'id': id});

    if (res.data == null ||
        res.exception != null ||
        res.data!['deleteMessage'] == null) {
      throw ServerException;
    }

    return res.data!['deleteMessage']['_id'];
  }

  @override
  Future<String> editMessage(String id, String body) async {
    final res = await server.postData('''
      mutation EditMessage(\$id: MongoID!, \$body: String!) {
        editMessage(id: \$id, body: \$body) {
          _id
        }
      }
      ''', {'id': id, 'body': body});

    if (res.data == null ||
        res.exception != null ||
        res.data!['editMessage'] == null) {
      throw ServerException;
    }

    return res.data!['editMessage']['_id'];
  }

  // TODO; move this to Server class
  @override
  Future<String?> uploadImage(String id, String path,
      {String? mimeType, void Function(int, int)? callback}) async {
    int byteCount = 0;
    final httpClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback = (cert, host, port) => true;
    final request = await httpClient.postUrl(
        Uri.parse('https://crafty-server.azurewebsites.net/api/upload/$id'));

    request.headers.set(
      HttpHeaders.authorizationHeader,
      'Bearer ${locator<App>().getUserToken()}',
    );

    final requestMultipart = http.MultipartRequest('POST', request.uri);
    requestMultipart.files.add(
      await http.MultipartFile.fromPath('image', path,
          contentType:
              MediaType.parse(mimeType ?? 'image/${path.split('.').last}')),
    );
    final byteStream = requestMultipart.finalize();

    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader]!);
    request.contentLength = requestMultipart.contentLength;

    final streamUpload = byteStream.transform<List<int>>(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);

          byteCount += data.length;

          if (callback != null) {
            callback(byteCount, requestMultipart.contentLength);
          }
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();

    print(httpResponse.statusCode);

    final body = StringBuffer();

    await for (final data in httpResponse.transform(utf8.decoder)) {
      body.write(data);
    }

    final map = json.decode(body.toString());

    return map['image'];
  }
}
