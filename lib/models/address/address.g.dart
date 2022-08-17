// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      address_id: json['address_id'] as String?,
      name: json['name'] as String?,
      contact_no: json['contact_no'] as String?,
      address: json['address'] as String?,
      city_id: json['city_id'] as String?,
      flat_number: json['flat_number'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      building_name: json['building_name'] as String?,
      landmark: json['landmark'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      address_type: json['address_type'] as String?,
      update: json['update'] as String?,
      delete: json['delete'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'address_id': instance.address_id,
      'name': instance.name,
      'contact_no': instance.contact_no,
      'address': instance.address,
      'city_id': instance.city_id,
      'flat_number': instance.flat_number,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'building_name': instance.building_name,
      'landmark': instance.landmark,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'address_type': instance.address_type,
      'update': instance.update,
      'delete': instance.delete,
    };
