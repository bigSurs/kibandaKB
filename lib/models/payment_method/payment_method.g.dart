// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentMethod _$$_PaymentMethodFromJson(Map<String, dynamic> json) =>
    _$_PaymentMethod(
      code: json['code'] as String?,
      terms: json['terms'] as String?,
      terms1: json['terms1'] as String?,
      sort_order: json['sort_order'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_PaymentMethodToJson(_$_PaymentMethod instance) =>
    <String, dynamic>{
      'code': instance.code,
      'terms': instance.terms,
      'terms1': instance.terms1,
      'sort_order': instance.sort_order,
      'title': instance.title,
    };
