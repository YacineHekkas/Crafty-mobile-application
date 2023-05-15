import 'package:cp_project/core/error/exceptions.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/registration/data/data_sources/remote_data_source/auth_source.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';
import 'package:cp_project/injection_container.dart';

class AuthSourceImpl implements AuthSource {
  @override
  final Server server;

  AuthSourceImpl({required this.server});

  @override
  Future<String> accountLogin(String indentifier, String password) async {
    final res = await server.fetchData("""
    query accountLogin(\$indentifier: String!,\$password: String!) {
        login(indentifier: \$indentifier, password: \$password) {
          id
          token
        }
      }
    """, vars: {
      "indentifier": indentifier,
      "password": password,
    });

    if (res.hasException && res.exception!.linkException == null) {
      throw res.exception!.graphqlErrors.first;
    }

    if (res.data == null ||
        res.exception != null ||
        res.data!['login'] == null) {
      print(res);

      throw ServerException;
    }

    locator<App>().setUserToken(res.data!['login']!['token']!);

    return res.data!['login']!['token']!;
  }

  @override
  Future<String> accountRegister(Registration data) async {
    final res = await server.postData("""
      mutation Register(\$record: CreateOneUserInput!) {
        register(record: \$record) {
          record {
            _id
          }
          token
          error {
            message
          }
        }

      }
    """, {
      "record": data.toJson(),
    });

    print(res);
    if (res.hasException && res.exception!.linkException == null) {
      throw res.exception!.graphqlErrors.first;
    }

    if (res.data != null && res.data!['register'] != null) {
      locator<App>().setUserToken(res.data!['register']!['token']!);
    }

    return res.data!['register']!['token']!;
  }

  @override
  Future<bool> getAccountVerificationStatus() async {
    final res = await server.fetchData("""
      mutation Mutation() {
        verifyUser()
      }
    """);

    if (res.hasException && res.exception!.linkException == null) {
      throw res.exception!.graphqlErrors.first;
    }
    if (res.data == null ||
        res.exception != null ||
        res.data!['verifyUser'] == null) {
      print(res);

      throw ServerException;
    }

    return res.data!['verifyUser'];
  }

  @override
  Future<void> sendVerificationCode() async {
    final res = await server.fetchData("""query Query {
            sendVerificationEmail
           }""");

    if (res.hasException && res.exception!.linkException == null) {
      throw res.exception!.graphqlErrors.first;
    }
    if (res.data == null ||
        res.exception != null ||
        res.data!['sendVerificationEmail'] == null) {
      print(res);

      throw ServerException;
    }
  }

  @override
  Future<bool> verifyCode(String code) async {
    final res = await server.postData("""
      mutation Mutation(\$code: String!) {
        verifyUser(code: \$code)
      }
      """, {"code": code});

    if (res.hasException && res.exception!.linkException == null) {
      throw res.exception!.graphqlErrors.first;
    }

    if (res.data == null ||
        res.exception != null ||
        res.data!['verifyUser'] == null) {
      print(res);

      throw ServerException;
    }

    return res.data!['verifyUser'];
  }
}
