import 'package:freezed_annotation/freezed_annotation.dart';

part 'kibanda.freezed.dart';
part 'kibanda.g.dart';

@freezed
class Kibanda with _$Kibanda {
  factory Kibanda(
      {num? customer_id,
      num? customer_group_id,
      num? store_id,
      String? token,
      String? firstname,
      String? lastname,
      String? email,
      String? telephone,
      String? fax,
      String? password,
      String? salt,
      String? cart,
      String? payment_terms,
      int? address_id,
      String? company_name,
      String? company_address,
      String? customer_category}) = _Kibanda;

  factory Kibanda.fromJson(Map<String, dynamic> json) =>
      _$KibandaFromJson(json);
}
