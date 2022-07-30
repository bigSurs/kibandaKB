part of 'vendor_products_cubit.dart';

@freezed
class VendorProductsState with _$VendorProductsState {
  const factory VendorProductsState.initial() = _Initial;
  const factory VendorProductsState.loading() = _Laoding;
  const factory VendorProductsState.success(
      {List<VendorProdcuts>? assignedProducts}) = _Success;
  const factory VendorProductsState.failed() = Failed_;
}
