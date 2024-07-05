import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptors extends Interceptor {
  final Dio client;

  AppInterceptors(this.client);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[\${options.method}] => PATH: \${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[\${response.statusCode}] => PATH: \${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[\${err.response?.statusCode}] => PATH: \${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      // TODO Handle unauthorized
    }
    super.onError(err, handler);
  }
}
