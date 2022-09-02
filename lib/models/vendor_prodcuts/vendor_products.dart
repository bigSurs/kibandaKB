import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_products.freezed.dart';
part 'vendor_products.g.dart';

@freezed
class VendorProducts with _$VendorProducts {
  factory VendorProducts({
    String? product_id,
    String? name,
    num? product_sr_no,
    String? model,
    String? default_price,
    String? thumb,
    String? image,
    String? unit,
    String? weight,
    String? produce_type,
    num? sort_order,
    String? price,
    String? product_store_id,
    String? special,
    num? tax_amount,
    String? tax_percentage,
    List<Map<String, dynamic>>? variations,
    String? left_symbol_currency,
    String? right_symbol_curreny,
  }) = _VendorProducts;

  factory VendorProducts.fromJson(Map<String, dynamic> json) =>
      _$VendorProductsFromJson(json);
}
