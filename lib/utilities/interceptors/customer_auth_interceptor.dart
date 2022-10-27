import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';

class CustomerAuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    CustomerTokenCubit customerTokenCubit = GetIt.I<CustomerTokenCubit>();

    options.headers[HttpHeaders.authorizationHeader] =
        'Bearer ${customerTokenCubit.state}';

    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    handler.next(options);
  }
}
