import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions.freezed.dart';
part 'transactions.g.dart';

@freezed
class Transactions with _$Transactions {
  factory Transactions({
    String? orderId,
    String? paymentMethod,
    String? date_added,
    String? currency_code,
    String? total,
    String? transactionId,
    bool? isSelected,
    String? amount_partialy_paid,
    String? shipping_address,
  }) = _Transactions;

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
}
