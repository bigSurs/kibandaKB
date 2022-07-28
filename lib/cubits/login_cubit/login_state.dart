part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  LoginSuccess({required this.loginResponse});
  @override
  List<Object?> get props => [loginResponse];
}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
