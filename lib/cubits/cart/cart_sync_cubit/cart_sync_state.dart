part of 'cart_sync_cubit.dart';

@freezed
class CartSyncState with _$CartSyncState {
  const factory CartSyncState.initial() = _Initial;
  const factory CartSyncState.loading() = _Loading;
  const factory CartSyncState.success() = _Success;
  const factory CartSyncState.failed(String error) = _Failed;
}
