// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponse _$$_LoginResponseFromJson(Map<String, dynamic> json) =>
    _$_LoginResponse(
      delivery_executive_id: json['delivery_executive_id'] as num?,
      order_processor_id: json['order_processor_id'] as num?,
      firstname: json['firstname'] as String?,
      status: json['status'] as num?,
      date_added: json['date_added'] as String?,
      username: json['username'] as String?,
      telephone: json['telephone'] as String?,
      order_processing_group_id: json['order_processing_group_id'] as num?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_LoginResponseToJson(_$_LoginResponse instance) =>
    <String, dynamic>{
      'delivery_executive_id': instance.delivery_executive_id,
      'order_processor_id': instance.order_processor_id,
      'firstname': instance.firstname,
      'status': instance.status,
      'date_added': instance.date_added,
      'username': instance.username,
      'telephone': instance.telephone,
      'order_processing_group_id': instance.order_processing_group_id,
      'lastname': instance.lastname,
      'email': instance.email,
      'token': instance.token,
    };
