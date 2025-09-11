import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
      "[DIO] REQUEST => ${options.method} ${options.uri}\n"
          "Headers: ${options.headers}\n"
          "Data: ${options.data}",
      // name: "DioLogger",
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      "[DIO] RESPONSE [${response.statusCode}] => ${response.requestOptions.uri}\n"
          "Data: ${response.data}",
      // name: "DioLogger",
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
      "[DIO] ERROR [${err.response?.statusCode}] => ${err.requestOptions.uri}\n"
          "Message: ${err.message}",
      // name: "DioLogger",
      // level: 1000,
    );
    super.onError(err, handler);
  }
}