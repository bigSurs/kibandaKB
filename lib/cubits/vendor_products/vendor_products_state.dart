part of 'vendor_products_cubit.dart';

@freezed
class VendorProductsState with _$VendorProductsState {
  const factory VendorProductsState.initial() = _Initial;
  const factory VendorProductsState.loading() = _Loading;
  const factory VendorProductsState.success(
      {required List<VendorProducts> vendorproducts}) = _Success;
  const factory VendorProductsState.failed(String error) = _Failed;
}
