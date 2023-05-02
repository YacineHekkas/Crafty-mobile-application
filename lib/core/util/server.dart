import 'dart:async';

import 'package:cp_project/core/error/exceptions.dart';
import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/core/network/network_info.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Server {
  final NetworkInfo networkInfo;

  const Server({required this.networkInfo});

  static final apiLink = HttpLink(
    'https://crafty-server.azurewebsites.net/api/v1',
    defaultHeaders: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImMzMTJkYmJjYTRlNGFhOTdkZDMxYWVhMiIsImlhdCI6MTY3OTY2ODE2NywiZXhwIjoxNzExMjI1NzY3fQ.R3CAE1dEbYKCAvRr2Ayzt9DM5klpuSkPSZeoqoehlyo',
    },
  );
  static final wsLink = WebSocketLink(
    'wss://crafty-server.azurewebsites.net/api/v1',
    subProtocol: GraphQLProtocol.graphqlTransportWs,
    config: SocketClientConfig(
      inactivityTimeout: null, // TODO: impl keep-alive feature
      initialPayload: apiLink.defaultHeaders,
      delayBetweenReconnectionAttempts:
          const Duration(seconds: 50), // TODO: look for optimised value of this
    ),
  );
  static final qlClient = GraphQLClient(
    link: Link.split((r) => r.isSubscription, wsLink, apiLink),
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );

  Future<QueryResult> fetchData(String doc, Map<String, dynamic> vars,
      {bool cacheFetch = true, bool forceNetworkFetch = false}) async {
    if (!(await networkInfo.isConnected)) throw OfflineException;
    return await qlClient.query(
      QueryOptions(
        document: gql(doc),
        variables: vars,
        fetchPolicy: cacheFetch
            ? FetchPolicy.cacheFirst
            : forceNetworkFetch
                ? FetchPolicy.networkOnly
                : FetchPolicy.cacheAndNetwork,
      ),
    );
  }

  Future<QueryResult> postData(String doc, Map<String, dynamic> vars) async {
    if (!(await networkInfo.isConnected)) throw OfflineException;

    return await qlClient
        .mutate(MutationOptions(document: gql(doc), variables: vars));
  }

  Future<void> initialize() async {
    wsLink.connectOrReconnect();

    // TODO: cache images also
    await initHiveForFlutter();
  }

  /* TODO: refactor this */
  Future<void> postFCMToken(String token) async {
    if (token.isEmpty) {
      return;
    }

    try {
      final res = await postData('''
          mutation UpdateFCM(\$token: String!) {
            updateFCM(token: \$token)
          }
        ''', {'token': token});

      print('sent $token');

      if (!res.data!['updateFCM']) {
        throw ServerFailure();
      }
    } catch (e) {
      throw ServerFailure();
    }
  }
}
