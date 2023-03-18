
import 'package:graphql_flutter/graphql_flutter.dart';

class Server {
  static final apiLink = HttpLink(
    'https://crafty-server.azurewebsites.net/api/v1',
    defaultHeaders: {
      'Authorization':
      'ggg eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmIxMTM4YzFhYTJkOWQ5OGVkMzdhMyIsImlhdCI6MTY3ODM3OTg1NSwiZXhwIjoxNzA5OTM3NDU1fQ.DLtg_AfthnCyTOnHnTNCj1k-yzhTnoErLOpXnUnXucw'
    });
  static final qlClient = GraphQLClient(
    link: apiLink,
    cache: GraphQLCache()
  );

  Future<QueryResult> fetchData(String doc, Map<String, dynamic> vars) async => await qlClient.query(QueryOptions(document: gql(doc), variables: vars));
  Future<QueryResult> postData(String doc, Map<String, dynamic> vars) async => await qlClient.mutate(MutationOptions(document: gql(doc), variables: vars));

  /*Future<void> updateFCMToken(String token) async {
    final res = await postData(
      '''
''', {
  fcmToken
})
    return;
  }*/
}
