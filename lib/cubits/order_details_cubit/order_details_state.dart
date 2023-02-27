part of 'order_details_cubit.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = _Initial;
  const factory OrderDetailsState.loading() = _Loading;
  const factory OrderDetailsState.success(OrderDetail orderDetail) = _Success;
  const factory OrderDetailsState.failed(String? failed) = _Failed;
}
