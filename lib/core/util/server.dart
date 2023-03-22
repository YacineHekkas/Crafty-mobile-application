import 'package:cp_project/core/error/failurs.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Server {
  static final apiLink = HttpLink(
    'https://crafty-server.azurewebsites.net/api/v1',
    defaultHeaders: {
      'Authorization':
      'gg eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmIxMTM4YzFhYTJkOWQ5OGVkMzdhNCIsImlhdCI6MTY3ODYxMTM3NSwiZXhwIjoxNzEwMTY4OTc1fQ.o9eObQTU8knOoBT9MV-0y-HMxLFD7DGP3opQPqKJVoY'
    });
  static final qlClient = GraphQLClient(
    link: apiLink,
    cache: GraphQLCache(
      store: HiveStore()
    )
  );

  Future<QueryResult> fetchData(String doc, Map<String, dynamic> vars, { bool cacheFetch = true, bool forceNetworkFetch = false }) async => await qlClient.query(QueryOptions(document: gql(doc), variables: vars, fetchPolicy: cacheFetch ? FetchPolicy.cacheFirst : forceNetworkFetch ? FetchPolicy.networkOnly : FetchPolicy.cacheAndNetwork));
  Future<QueryResult> postData(String doc, Map<String, dynamic> vars) async => await qlClient.mutate(MutationOptions(document: gql(doc), variables: vars));

  Future<void> initialize() async {
    // TODO: cache images also
    await initHiveForFlutter();
  }

  /* TODO: refactor this */
  Future<void> postFCMToken(String token) async {
    if (token.isEmpty) {
      return;
    }

    try {
      final res = await postData(
        '''
          mutation UpdateFCM(\$token: String!) {
            updateFCM(token: \$token)
          }
        ''', {
          'token': token
      });

      print('sent $token');

      if (!res.data!['updateFCM']) {
        throw ServerFailure();
      }
    } catch (e) {
      throw ServerFailure();
    }
  }
}
