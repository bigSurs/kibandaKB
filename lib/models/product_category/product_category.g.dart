// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCategory _$$_ProductCategoryFromJson(Map<String, dynamic> json) =>
    _$_ProductCategory(
      category_id: json['category_id'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      meta_description: json['meta_description'] as String?,
      name: json['name'] as String?,
      parent_id: json['parent_id'] as String?,
      status: json['status'] as String?,
      sort_order: json['sort_order'] as String?,
      thumb: json['thumb'] as String?,
      thumb_two: json['thumb_two'] as String?,
      products_count: json['products_count'] as int?,
    );

Map<String, dynamic> _$$_ProductCategoryToJson(_$_ProductCategory instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'image': instance.image,
      'description': instance.description,
      'meta_description': instance.meta_description,
      'name': instance.name,
      'parent_id': instance.parent_id,
      'status': instance.status,
      'sort_order': instance.sort_order,
      'thumb': instance.thumb,
      'thumb_two': instance.thumb_two,
      'products_count': instance.products_count,
    };
