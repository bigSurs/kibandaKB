part of 'wishlist_cubit.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;
  const factory WishlistState.loading() = _Loading;
  const factory WishlistState.success(List<Wishlist> wishlists) = _Success;
  const factory WishlistState.failed(String error) = _Failed;
}
