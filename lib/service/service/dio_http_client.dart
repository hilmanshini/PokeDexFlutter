import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class DioHttpClient extends http.BaseClient {
  final Dio dio;
  final int timeoutInSeconds;

  DioHttpClient(this.dio, this.timeoutInSeconds);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      final body = request is http.Request ? request.body : null;

      final options = Options(
        method: request.method,
        headers: request.headers,
        responseType: ResponseType.stream,
      );

      final response = await dio.requestUri<ResponseBody>(
        request.url,
        data: body,
        options: options,
      );

      final stream = response.data!.stream;
      final statusCode = response.statusCode ?? 500;

      return http.StreamedResponse(
        stream,
        statusCode,
        headers: response.headers.map.map(
              (k, v) => MapEntry(k, v.join(',')),
        ),
        reasonPhrase: response.statusMessage,
      );
    } on DioException catch (e) {
      final msg = e.message ?? "Dio request error";
      final data = Uint8List.fromList(msg.codeUnits);
      final stream = Stream<List<int>>.fromIterable([data]);

      return http.StreamedResponse(
        stream,
        e.response?.statusCode ?? 500,
        reasonPhrase: msg,
      );
    }
  }
}