part of 'product_search_cubit.dart';

@freezed
class ProductSearchState with _$ProductSearchState {
  const factory ProductSearchState.initial() = _Initial;
  const factory ProductSearchState.loading() = _Loading;
  const factory ProductSearchState.success(
      {required List<VendorProducts> products,
      required String search}) = _Success;
  const factory ProductSearchState.failed(String error) = _Failed;
}
