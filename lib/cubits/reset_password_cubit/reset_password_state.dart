part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponse resetPasswordResponse;

  ResetPasswordSuccess(this.resetPasswordResponse);
  @override
  List<Object?> get props => [];
}

class ResetPasswordFailed extends ResetPasswordState {
  final String error;

  ResetPasswordFailed(this.error);
  @override
  List<Object?> get props => [error];
}
