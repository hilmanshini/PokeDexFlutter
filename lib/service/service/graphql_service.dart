import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:graphql/client.dart';
import 'package:pokemon2/service/service/dio_http_client.dart';

import 'logger_service.dart';

class GraphQLService {
  late GraphQLClient client;

  GraphQLService({
    required String endpoint ,
    required int timeoutInSeconds
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: timeoutInSeconds),
        receiveTimeout: Duration(seconds: timeoutInSeconds),
        sendTimeout: Duration(seconds: timeoutInSeconds),
      ),
    );

    // 🔥 Tambahkan logger interceptor di sini
    dio.interceptors.add(LoggerInterceptor());
    final dioHttpClient = DioHttpClient(dio);

    final HttpLink httpLink = HttpLink(
      endpoint,
      httpClient: dioHttpClient,
    );

    client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
  }

  Future<QueryResult> query(
      String query, {
        Map<String, dynamic> variables = const {},
      }) async {
    developer.log("[GraphQL] QUERY $variables", name: "GraphQLService");

    final options = QueryOptions(
      document: gql(query),
      variables: variables,
    );

    final result = await client.query(options);

    if (result.hasException) {
      developer.log("[GraphQL] ERROR: ${result.exception}", name: "GraphQLService", level: 1000);
    } else {
      developer.log("[GraphQL] RESPONSE: ${result.data}", name: "GraphQLService");
    }

    return result;
  }

  Future<QueryResult> mutate(
      String mutation, {
        Map<String, dynamic> variables = const {},
      }) async {
    developer.log("[GraphQL] MUTATION $variables", name: "GraphQLService");

    final options = MutationOptions(
      document: gql(mutation),
      variables: variables,
    );

    final result = await client.mutate(options);

    if (result.hasException) {
      developer.log("[GraphQL] ERROR: ${result.exception}", name: "GraphQLService", level: 1000);
    } else {
      developer.log("[GraphQL] RESPONSE: ${result.data}", name: "GraphQLService");
    }

    return result;
  }
}