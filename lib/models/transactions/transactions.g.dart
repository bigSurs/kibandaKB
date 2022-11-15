// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transactions _$$_TransactionsFromJson(Map<String, dynamic> json) =>
    _$_Transactions(
      orderId: json['orderId'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      date_added: json['date_added'] as String?,
      currency_code: json['currency_code'] as String?,
      total: json['total'] as String?,
      transactionId: json['transactionId'] as String?,
      isSelected: json['isSelected'] as bool?,
      amount_partialy_paid: json['amount_partialy_paid'] as String?,
      shipping_address: json['shipping_address'] as String?,
    );

Map<String, dynamic> _$$_TransactionsToJson(_$_Transactions instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentMethod': instance.paymentMethod,
      'date_added': instance.date_added,
      'currency_code': instance.currency_code,
      'total': instance.total,
      'transactionId': instance.transactionId,
      'isSelected': instance.isSelected,
      'amount_partialy_paid': instance.amount_partialy_paid,
      'shipping_address': instance.shipping_address,
    };
