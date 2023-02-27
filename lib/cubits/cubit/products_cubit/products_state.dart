part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.success(
      {required List<VendorProducts> products, required String search}) = _Success;
  const factory ProductsState.failed(String error) = _Error;
}
