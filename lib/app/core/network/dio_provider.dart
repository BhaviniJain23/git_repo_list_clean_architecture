import 'dart:io';

import 'package:ailoitte/app/core/constants/app_endpoints.dart';
import 'package:ailoitte/app/core/network/app_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class DioProvider {
  static final Dio _dioInstance = _configureDio();

  static Dio get dioInstance => _dioInstance;

  static Dio _configureDio() {
    final dio = Dio();

    // Configure the HttpClientAdapter for handling HTTPS requests
    dio.httpClientAdapter = IOHttpClientAdapter(
      // Customizing HttpClient to accept all certificates
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    // Set base options for Dio
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false;

    // Add interceptors
    dio.interceptors.add(AppInterceptors(dio));
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor());
    }

    return dio;
  }
}
