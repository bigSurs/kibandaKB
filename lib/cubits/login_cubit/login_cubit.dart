import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/api_response/api_response.dart';
import 'package:kibanda_kb/models/login_response/login_response.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login({required Map<String, dynamic> data}) async {
    emit(LoginLoading());
    try {
      ApiResponse apiResponse = ApiResponse.fromJson(
          await ApiService.post(data: data, path: 'login'));
      LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.data!);
      emit(LoginSuccess(loginResponse: loginResponse));
    } on String catch (e) {
      emit(LoginFailed(error: e));
    } catch (e) {
      emit(LoginFailed(error: 'An error has occured'));
    }
  }
}
