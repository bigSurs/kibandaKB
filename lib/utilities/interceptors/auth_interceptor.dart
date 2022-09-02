import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';
import 'package:kibanda_kb/authentication/token_cubit.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    TokenCubit tokenCubit = GetIt.I<TokenCubit>();
    CustomerTokenCubit customerTokenCubit = GetIt.I<CustomerTokenCubit>();
    String? token = tokenCubit.state;

    /// Add the bearer token header to all requests except the login request
    if (!options.path.contains('login') ||
        !options.path.endsWith('ordernew') ||
        !options.path.endsWith('productsearch')) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    } else if (options.path.endsWith('productsearch')) {
      options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${customerTokenCubit.state}';
    }

    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    handler.next(options);
  }
}
