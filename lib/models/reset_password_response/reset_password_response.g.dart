// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResetPasswordResponse _$$_ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ResetPasswordResponse(
      delivery_executive_id: json['delivery_executive_id'] as int?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      status: json['status'] as int?,
      date_added: json['date_added'] as String?,
    );

Map<String, dynamic> _$$_ResetPasswordResponseToJson(
        _$_ResetPasswordResponse instance) =>
    <String, dynamic>{
      'delivery_executive_id': instance.delivery_executive_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'telephone': instance.telephone,
      'status': instance.status,
      'date_added': instance.date_added,
    };
