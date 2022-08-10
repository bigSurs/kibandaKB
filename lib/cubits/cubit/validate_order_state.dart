part of 'validate_order_cubit.dart';

@freezed
class ValidateOrderState with _$ValidateOrderState {
  const factory ValidateOrderState.initial() = _Initial;
  const factory ValidateOrderState.loading() = _Loading;
  const factory ValidateOrderState.success() = _Success;
  const factory ValidateOrderState.failed(String error) = _Failed;
}
