import 'package:freezed_annotation/freezed_annotation.dart';

part '../vendor_prodcuts.freezed.dart';
part '../vendor_prodcuts.g.dart';

@freezed
class VendorProdcuts with _$VendorProdcuts {
  factory VendorProdcuts({
    int? product_id,
    String? name,
    num? product_sr_no,
    String? model,
    String? default_price,
    String? image,
    String? unit,
    String? weight,
    String? produce_type,
    num? sort_order,
    String? price,
    num? max_qty,
    num? min_quantity,
    String? left_symbol_currency,
    String? right_symbol_curreny,

  }) = _VendorProdcuts;

  factory VendorProdcuts.fromJson(Map<String, dynamic> json) =>
      _$VendorProdcutsFromJson(json);
}
