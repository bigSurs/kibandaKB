// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      key: json['key'] as String?,
      qty_in_cart: json['qty_in_cart'] as int?,
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      store_product_variation_id: json['store_product_variation_id'] as int?,
      product_id: json['product_id'] as String?,
      model: json['model'] as String?,
      product_store_id: json['product_store_id'] as String?,
      store_id: json['store_id'] as String?,
      product_info: json['product_info'] as Map<String, dynamic>?,
      image: json['image'] as String?,
      default_variation_name: json['default_variation_name'] as String?,
      thumb: json['thumb'] as String?,
      name: json['name'] as String?,
      quantity: json['quantity'] as String?,
      unit: json['unit'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      special: json['special'] as String?,
      percent_off: json['percent_off'] as String?,
      left_symbol_currency: json['left_symbol_currency'] as String?,
      right_symbol_currency: json['right_symbol_currency'] as String?,
      tax: json['tax'] as String?,
      tax_class_id: json['tax_class_id'] as String?,
      tax_amount: json['tax_amount'] as num?,
      tax_name: json['tax_name'] as String?,
      max_qty: json['max_qty'] as String?,
      rating: json['rating'] as int?,
      href: json['href'] as String?,
      category_name: json['category_name'] as String?,
      product_type: json['product_type'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'key': instance.key,
      'qty_in_cart': instance.qty_in_cart,
      'variations': instance.variations,
      'store_product_variation_id': instance.store_product_variation_id,
      'product_id': instance.product_id,
      'model': instance.model,
      'product_store_id': instance.product_store_id,
      'store_id': instance.store_id,
      'product_info': instance.product_info,
      'image': instance.image,
      'default_variation_name': instance.default_variation_name,
      'thumb': instance.thumb,
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'description': instance.description,
      'price': instance.price,
      'special': instance.special,
      'percent_off': instance.percent_off,
      'left_symbol_currency': instance.left_symbol_currency,
      'right_symbol_currency': instance.right_symbol_currency,
      'tax': instance.tax,
      'tax_class_id': instance.tax_class_id,
      'tax_amount': instance.tax_amount,
      'tax_name': instance.tax_name,
      'max_qty': instance.max_qty,
      'rating': instance.rating,
      'href': instance.href,
      'category_name': instance.category_name,
      'product_type': instance.product_type,
    };
