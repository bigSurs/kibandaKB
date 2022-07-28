import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:kibanda_kb/models/api_response/api_response.dart';
import 'package:kibanda_kb/models/reset_password_response/reset_password_response.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  resetPassword({required Map<String, dynamic> data}) async {
    emit(ResetPasswordLoading());
    try {
      ApiResponse apiResponse = ApiResponse.fromJson(
          await ApiService.post(data: data, path: '/forgotPassword'));
      ResetPasswordResponse resetPasswordResponse =
          ResetPasswordResponse.fromJson(apiResponse.data!);
      emit(ResetPasswordSuccess(resetPasswordResponse));
    } on String catch (e) {
      emit(ResetPasswordFailed(e));
    } catch (e) {
      emit(ResetPasswordFailed('An error has occured'));
    }
  }
}
