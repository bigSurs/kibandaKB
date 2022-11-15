part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.success(
      {required List<Transactions> pendingTransactions,
      required List<Transactions> successfulTransactions,
      required List<Transactions> cancelledTransactions}) = _Success;
  const factory TransactionState.failed(String error) = _Failed;
}
