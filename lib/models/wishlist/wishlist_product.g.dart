// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishlistProduct _$$_WishlistProductFromJson(Map<String, dynamic> json) =>
    _$_WishlistProduct(
      name: json['name'] as String?,
      wishlist_id: json['wishlist_id'] as String?,
      product_id: json['product_id'] as String?,
      product_store_id: json['product_store_id'] as String?,
      store_id: json['store_id'] as String?,
      quantity: json['quantity'] as String?,
      image: json['image'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$_WishlistProductToJson(_$_WishlistProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'wishlist_id': instance.wishlist_id,
      'product_id': instance.product_id,
      'product_store_id': instance.product_store_id,
      'store_id': instance.store_id,
      'quantity': instance.quantity,
      'image': instance.image,
      'unit': instance.unit,
    };
