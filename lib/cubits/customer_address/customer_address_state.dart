part of 'customer_address_cubit.dart';

@freezed
class CustomerAddressState with _$CustomerAddressState {
  const factory CustomerAddressState.initial() = _Initial;
  const factory CustomerAddressState.loading() = _Loading;
  const factory CustomerAddressState.success() = _Success;
  const factory CustomerAddressState.failed(String error) = _Failed;
}
