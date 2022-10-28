part of 'my_orders_cubit.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState.initial() = _Initial;
  const factory MyOrdersState.loading() = _Loading;
  const factory MyOrdersState.success(List<Order> orders) = _Success;
  const factory MyOrdersState.failed(String error) = _Failed;
}
