// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Variation _$$_VariationFromJson(Map<String, dynamic> json) => _$_Variation(
      product_store_id: json['product_store_id'] as String?,
      product_id: json['product_id'] as String?,
      store_id: json['store_id'] as String?,
      price: json['price'] as String?,
      tax_percentage: json['tax_percentage'] as String?,
      subtract_quantity: json['subtract_quantity'] as String?,
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      variation_id: json['variation_id'] as String?,
    );

Map<String, dynamic> _$$_VariationToJson(_$_Variation instance) =>
    <String, dynamic>{
      'product_store_id': instance.product_store_id,
      'product_id': instance.product_id,
      'store_id': instance.store_id,
      'price': instance.price,
      'tax_percentage': instance.tax_percentage,
      'subtract_quantity': instance.subtract_quantity,
      'name': instance.name,
      'unit': instance.unit,
      'variation_id': instance.variation_id,
    };
