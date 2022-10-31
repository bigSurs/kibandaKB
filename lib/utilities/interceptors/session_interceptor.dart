import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/session_cubit.dart';

class SessionInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SessionCubit sessionCubit = GetIt.I<SessionCubit>();
    String? session = sessionCubit.state;

    /// Add the session token header to all requests except the login request
    if (!options.path.contains('login')) {
      options.headers[HttpHeaders.cookieHeader] = 'PHPSESSID=$session';
    }

    handler.next(options);
  }
}
