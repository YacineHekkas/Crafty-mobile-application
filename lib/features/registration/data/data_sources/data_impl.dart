import 'dart:ffi';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/injection_container.dart';
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

      if (queryResult.data == null) {
        throw const ServerException();
      }

      locator<App>().setUserToken(queryResult.data!['login']['token']);
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
      final mutationresult = await locator<Server>().postData("""
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

}""", {
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
          "provider": locator<App>().getProvider() ?? false,
        }
      });

      print(mutationresult);
      if (mutationresult.data != null &&
          mutationresult.data!['register'] != null) {
        locator<App>().setUserToken(mutationresult.data!['register']['token']!);
      }
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
  Future<void> Sendverification() async {
    try {
      final queryResult = await locator<Server>().fetchData("""query Query {
             sendVerificationEmail
           }""");
      print(queryResult);
    } catch (e) {}
  }

  @override
  Future<bool> Isverified(String code1) async {
    try {
      final mutationresult = await locator<Server>().postData(""" mutation Mutation(\$code: String!) {
  verifyUser(code: \$code)
}""", {"code": code1});

      print(mutationresult);

    return mutationresult.exception == null && mutationresult.data != null && mutationresult.data!['verifyUser'] != null;

    } catch (e) {}
  
  return false;
  }
}
