part of 'transactional_payment_cubit.dart';

@freezed
class TransactionalPaymentState with _$TransactionalPaymentState {
  const factory TransactionalPaymentState.initial() = _Initial;
  const factory TransactionalPaymentState.requesting() = _Requesting;
  const factory TransactionalPaymentState.requested() = _Requested;
  const factory TransactionalPaymentState.confirming() = _Confirming;
  const factory TransactionalPaymentState.confirmed() = _Confirmed;
  const factory TransactionalPaymentState.failed(String e) = _Failed;
}
