import 'package:freezed_annotation/freezed_annotation.dart';

part 'variation.freezed.dart';
part 'variation.g.dart';

@freezed
class Variation with _$Variation {
  factory Variation({
    String? product_store_id,
    String? product_id,
    String? store_id,
    String? price,
    String? tax_percentage,
    String? subtract_quantity,
    String? name,
    String? unit,
    String? variation_id,
  }) = _Variation;

  factory Variation.fromJson(Map<String, dynamic> json) =>
      _$VariationFromJson(json);
}
