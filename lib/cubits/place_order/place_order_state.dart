part of 'place_order_cubit.dart';

@freezed
class PlaceOrderState with _$PlaceOrderState {
  const factory PlaceOrderState.initial() = _Initial;
  const factory PlaceOrderState.loading() = _Loading;
  const factory PlaceOrderState.success() = _Success;
  const factory PlaceOrderState.failed(String error) = _Failed;
}
