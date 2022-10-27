part of 'payment_method_cubit.dart';

@freezed
class PaymentMethodState with _$PaymentMethodState {
  const factory PaymentMethodState.initial() = _Initial;
  const factory PaymentMethodState.loading() = _Loading;
  const factory PaymentMethodState.success(List<PaymentMethod> paymentMethods) =
      _Success;
  const factory PaymentMethodState.failed(String error) = _Error;
}
