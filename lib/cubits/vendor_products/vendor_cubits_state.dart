part of 'vendor_cubits_cubit.dart';

@freezed
class VendorCubitsState with _$VendorCubitsState {
  const factory VendorCubitsState.initial() = _Initial;
  const factory VendorCubitsState.loading() = _Loading;
  const factory VendorCubitsState.success(
    {List<VendorProdcuts>? assignedProducts}
  ) = _Success;
  const factory VendorCubitsState.failed() = _Failed;
}
