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
      store_id: json['store_id'] as num?,
      product_store_id: json['product_store_id'] as num?,
      special: json['special'] as String?,
      tax_amount: json['tax_amount'] as num?,
      tax_percentage: json['tax_percentage'] as String?,
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
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
      'store_id': instance.store_id,
      'product_store_id': instance.product_store_id,
      'special': instance.special,
      'tax_amount': instance.tax_amount,
      'tax_percentage': instance.tax_percentage,
      'variations': instance.variations,
      'left_symbol_currency': instance.left_symbol_currency,
      'right_symbol_curreny': instance.right_symbol_curreny,
    };
