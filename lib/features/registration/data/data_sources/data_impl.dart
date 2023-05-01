import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cp_project/features/registration/data/data_sources/dataSource.dart';
import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Dataimpl implements Datasource {
  @override
  Future<bool> IsLogIn() {
    // TODO: implement IsLogIn
    throw UnimplementedError();
  }

  @override
  Future<void> login(String pass, String ind) async {
    print(pass);
    print(ind);
    try {
      GraphQLClient qlClient = GraphQLClient(
        link: _apiLink(),
        cache: GraphQLCache(),
      );
      QueryResult queryResult = await qlClient.query(QueryOptions(
          document: gql(
              """query ExampleQuery(\$indentifier: String!,\$password: String!) {
  login(indentifier: \$indentifier, password: \$password) {
    id
    token
  }
}"""),
          variables: {
            "password": pass,
            "indentifier": ind,
          }));
      print(queryResult);
      _savetoken(queryResult.data!['login']['token']);

      if (queryResult.data!['token'] == null) {
        print('try again ');
      }
    } catch (e, s) {
      print(e);
      print(s);
      throw const ServerException();
    }
  }

  @override
  Future<void> signUP(UserS users) async {
    try {
      GraphQLClient qlClient = GraphQLClient(
        link: _apiLink(),
        cache: GraphQLCache(),
      );
      final mutationresult = await qlClient.mutate(
        MutationOptions(
          document: gql("""
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

}"""),
          variables: {
            "record": {
              "email": users.email!,
              "gender": users.gender!,
              "location": {
                "type": "Point",
                "district": users.location.district!,
                "state": users.location.state!,
                "coordinates": users.location.coordinates
              },
              "password": users.password!,
              "phone": users.phone!,
              "username": users.username!,
              "name": users.name!,
            }
          },
        ),
      );

      print(mutationresult);
    } catch (e) {
      print(e);
      throw const ServerException();
    }
  }

  HttpLink _apiLink() {
    return HttpLink(
      "https://crafty-server.azurewebsites.net/api/v1",
    );
  }

  @override
  Future<Void> Sendverification() async {
    try {
      GraphQLClient qlClient = GraphQLClient(
        link: _apiLink(),
        cache: GraphQLCache(),
      );

      QueryResult queryResult =
          await qlClient.query(QueryOptions(document: gql("""query Query {
             sendVerificationEmail
           }""")));
      print(queryResult);
    } catch (e) {}
    return Sendverification();
  }

  @override
  Future<bool> Isverified(String code1) async {
    try {
      GraphQLClient qlClient = GraphQLClient(
        link: _apiLink(),
        cache: GraphQLCache(),
      );

      final mutationresult = await qlClient.mutate(MutationOptions(
        document: gql(""" mutation Mutation(\$code: String!) {
  verifyUser(code: \$code)
}"""),
        variables: {"code": code1},
      ));

      print(mutationresult);
    } catch (e) {}
    return Isverified(code1);
  }

  _savetoken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    await prefs.setString(token, value);
    print('this is the key : $value');
  }

  readtoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = await prefs.get(key) ?? 0;
    print('read : $value');
  }
}
