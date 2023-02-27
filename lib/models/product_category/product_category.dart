import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

@freezed
class ProductCategory with _$ProductCategory {
  factory ProductCategory(
      {String? category_id,
      String? image,
      String? description,
      String? meta_description,
      String? name,
      String? parent_id,
      String? status,
      String? sort_order,
      String? thumb,
      String? thumb_two,
      int? products_count}) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
