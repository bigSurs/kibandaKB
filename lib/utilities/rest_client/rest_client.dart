import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kibanda_kb/utilities/interceptors/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// This class configures the base API requests

class RestClient {
  Dio? _dio;

  Dio? get dio => _dio;

  String baseURL = 'https://stage.salesexecutiveapi.kwikbasket.com/api/';

  RestClient({BaseOptions? options}) {
    create(options);
  }

  /// Instantiate the restclient class
  void create([BaseOptions? options]) {
    _dio = Dio(options);

    ///Add the interceptors
    // The [AuthInterceptor] to authenticate all requests
    _dio!.interceptors.add(AuthInterceptor());
    if (kDebugMode) {
      //The logger interceptor
      _dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }
}
