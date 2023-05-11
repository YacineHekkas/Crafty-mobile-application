import 'dart:io';

import 'package:cp_project/core/error/Messages.dart';
import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/account/data/models/user_model.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/injection_container.dart';
import 'dart:async';

import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;


class UserDataSourceImpl{
  final server = locator<Server>();

  Future<UserModel> getUserData() async {
    try {
      final res = await server.fetchData(
        '''
          query GetUser {
  fetchUser {
    avatar {
      url
    }
    createdAt
    email
     _id
    gender
    location {
      state
      district
    }
    name
    password
    phone
    provider
    tags
    username
  }
}
        ''',
        cacheFetch: false,
        forceNetworkFetch: true,
      );
      print('----USER----->query data :${res.data}');
      final result = UserModel.fromJson(res.data!);
      return Future.value(result);
    } catch (e, stackTrace) {
      print('---->$e///////USERUSERUSER//////$stackTrace');
      throw ServerFailure();
    }
  }

  Future<UserEntity> userInfo() async{
    return await getUserData().then(
            (value) => UserEntity
              (
                avatar: value.fetchUser.avatar,
                createdAt: value.fetchUser.createdAt??'',
                email: value.fetchUser.email,
                id : value.fetchUser.id,
                gender: value.fetchUser.gender,
                location: value.fetchUser.location,
                name: value.fetchUser.name,
                phone: value.fetchUser.phone,
                password: value.fetchUser.password,
                provider: value.fetchUser.provider,
                tags: value.fetchUser.tags,
                username: value.fetchUser.username
            )
    );
  }

  Future<void> uploadAvatarPhoto(String id,String path) async {
    int byteCount = 0;
    final httpClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback = (cert, host, port) => true;
    final request = await httpClient.postUrl( Uri.parse('https://crafty-server.azurewebsites.net/api/upload/$id'),);
    request.headers.set(
      HttpHeaders.authorizationHeader,
      'Bearer ${locator<App>().getUserToken()}',
    );
    final requestMultipart = http.MultipartRequest('POST', request.uri);
    requestMultipart.files.add(
      await http.MultipartFile.fromPath(
        'avatar',
        path,
        contentType: MediaType('image', 'png'),
      ),
    );
    final byteStream = requestMultipart.finalize();

    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader]!
    );

    request.contentLength = requestMultipart.contentLength;

    final streamUpload = byteStream.transform<List<int>>(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);
          byteCount += data.length;
          print('+++++++++++++++++++++++++++++++++>>$byteCount');
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


    print('---------///////----------->>${httpResponse.statusCode}');

  }

  Future<String> becomeProvider() async {
    try{
      final res = await server.postData(
          '''
            mutation Mutation(\$record: UpdateByIdUserInput!) {
                updateUser(record: \$record) {
                  record {
                    provider
                  }
                  error {
      ... on ValidationError {
        message
        errors {
          path
          value
        }
      }
    }
                }
              }   
          ''',
           {
            'record': {
              "provider": true
            }
          }
      );

      print('-----+++---->query data :${res.data}');
      return Future.value(Messages.providerBecome);

    }catch(e,stackTrace) {
      print('---->$e/////////////$stackTrace');
      throw ServerFailure();
    }
  }
}