// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VendorProducts _$$_VendorProductsFromJson(Map<String, dynamic> json) =>
    _$_VendorProducts(
      product_id: json['product_id'] as int?,
      name: json['name'] as String?,
      product_sr_no: json['product_sr_no'] as num?,
      model: json['model'] as String?,
      default_price: json['default_price'] as String?,
      image: json['image'] as String?,
      unit: json['unit'] as String?,
      weight: json['weight'] as String?,
      produce_type: json['produce_type'] as String?,
      sort_order: json['sort_order'] as num?,
      price: json['price'] as String?,
      max_qty: json['max_qty'] as num?,
      min_quantity: json['min_quantity'] as num?,
      left_symbol_currency: json['left_symbol_currency'] as String?,
      right_symbol_curreny: json['right_symbol_curreny'] as String?,
    );

Map<String, dynamic> _$$_VendorProductsToJson(_$_VendorProducts instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'product_sr_no': instance.product_sr_no,
      'model': instance.model,
      'default_price': instance.default_price,
      'image': instance.image,
      'unit': instance.unit,
      'weight': instance.weight,
      'produce_type': instance.produce_type,
      'sort_order': instance.sort_order,
      'price': instance.price,
      'max_qty': instance.max_qty,
      'min_quantity': instance.min_quantity,
      'left_symbol_currency': instance.left_symbol_currency,
      'right_symbol_curreny': instance.right_symbol_curreny,
    };
