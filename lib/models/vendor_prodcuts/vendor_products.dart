import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_products.freezed.dart';
part 'vendor_products.g.dart';

@freezed
class VendorProducts with _$VendorProducts {
  factory VendorProducts(
   {String? key,
      int? qty_in_cart,
      List<Map<String, dynamic>>? variations,
      int? store_product_variation_id,
      String? product_id,
      String? model,
      String? product_store_id,
      String? store_id,
      Map<String, dynamic>? product_info,
      String? image,
      String? default_variation_name,
      String? thumb,
      String? name,
      String? quantity,
      String? unit,
      String? description,
      String? price,
      String? special,
      String? percent_off,
      String? left_symbol_currency,
      String? right_symbol_currency,
      String? tax,
      String? tax_class_id,
      // String? tax_percentage,
      num? tax_amount,
      String? tax_name,
      String? max_qty,
      int? rating,
      String? href,
      String? category_name,
      String? product_type
  }) = _VendorProducts;

  factory VendorProducts.fromJson(Map<String, dynamic> json) =>
      _$VendorProductsFromJson(json);
}
