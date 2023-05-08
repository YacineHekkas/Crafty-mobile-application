import 'dart:async';

import 'package:cp_project/core/error/exceptions.dart';
import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/core/network/network_info.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/injection_container.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Server {
  final NetworkInfo networkInfo;

  Server({required this.networkInfo});

  HttpLink get apiLink => HttpLink(
        'https://crafty-server.azurewebsites.net/api/v1',
        defaultHeaders: {
          'Authorization': 'Bearer ${locator<App>().getUserToken()}',
        },
      );
  WebSocketLink get wsLink => WebSocketLink(
        'wss://crafty-server.azurewebsites.net/api/v1',
        subProtocol: GraphQLProtocol.graphqlTransportWs,
        config: SocketClientConfig(
          inactivityTimeout: null, // TODO: impl keep-alive feature
          initialPayload: apiLink.defaultHeaders,
          delayBetweenReconnectionAttempts: const Duration(
              seconds: 50), // TODO: look for optimised value of this
        ),
      );
  GraphQLClient get qlClient => GraphQLClient(
        link: Link.split((r) => r.isSubscription, wsLink, apiLink),
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      );

  Future<QueryResult> fetchData(String doc,
      {Map<String, dynamic> vars = const {},
      bool cacheFetch = true,
      bool forceNetworkFetch = false}) async {
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

  Future<QueryResult> postData(String doc,
      Map<String, dynamic> vars) async {
    print(apiLink.defaultHeaders);
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
