import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
class PaymentMethod with _$PaymentMethod {
  factory PaymentMethod(
      {String? code,
      String? terms,
      String? terms1,
      String? sort_order,
      String? title}) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}
