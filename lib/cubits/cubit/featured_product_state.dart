part of 'featured_product_cubit.dart';

@freezed
class FeaturedProductState with _$FeaturedProductState {
  const factory FeaturedProductState.initial() = _Initial;
  const factory FeaturedProductState.loading() = _Loading;
  const factory FeaturedProductState.success(
      {required List<VendorProducts> products,  required bool isLast, required int page}) = _Success;
  const factory FeaturedProductState.failed(String error) = _Failed;
}
// required int page,