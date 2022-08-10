// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wishlist _$$_WishlistFromJson(Map<String, dynamic> json) => _$_Wishlist(
      name: json['name'] as String?,
      wishlist_id: json['wishlist_id'] as String?,
      date_added: json['date_added'] as String?,
      product_count: json['product_count'] as int?,
      products: json['products'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_WishlistToJson(_$_Wishlist instance) =>
    <String, dynamic>{
      'name': instance.name,
      'wishlist_id': instance.wishlist_id,
      'date_added': instance.date_added,
      'product_count': instance.product_count,
      'products': instance.products,
    };
