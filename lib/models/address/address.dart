import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address(
      {String? address_id,
      String? name,
      String? contact_no,
      String? address,
      String? city_id,
      String? flat_number,
      String? latitude,
      String? longitude,
      String? building_name,
      String? landmark,
      String? city,
      String? zipcode,
      String? address_type,
      String? update,
      String? delete}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
