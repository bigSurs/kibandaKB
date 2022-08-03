part of 'login_as_customer_cubit.dart';

@freezed
class LoginAsCustomerState with _$LoginAsCustomerState {
  const factory LoginAsCustomerState.initial() = _Initial;
  const factory LoginAsCustomerState.loading() = _Loading;
  const factory LoginAsCustomerState.success() = _Success;
  const factory LoginAsCustomerState.failed(String error) = _Failed;
}
