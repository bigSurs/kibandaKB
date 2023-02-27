// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      customer_id: json['customer_id'] as String?,
      customer_group_id: json['customer_group_id'] as String?,
      store_id: json['store_id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      fax: json['fax'] as String?,
      password: json['password'] as String?,
      salt: json['salt'] as String?,
      address_id: json['address_id'] as String?,
      company_name: json['company_name'] as String?,
      company_address: json['company_address'] as String?,
      approved: json['approved'] as String?,
      safe: json['safe'] as String?,
      token: json['token'] as String?,
      member_upto: json['member_upto'] as String?,
      date_added: json['date_added'] as String?,
      sms_notification: json['sms_notification'] as String?,
      mobile_notification: json['mobile_notification'] as String?,
      email_notification: json['email_notification'] as String?,
      pezesha_status: json['pezesha_status'] as String?,
      pezesha_customer_id: json['pezesha_customer_id'] as String?,
      pezesha_customer_uuid: json['pezesha_customer_uuid'] as String?,
      pezesha_identifier: json['pezesha_identifier'] as String?,
      credit_period: json['credit_period'] as String?,
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customer_id,
      'customer_group_id': instance.customer_group_id,
      'store_id': instance.store_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'telephone': instance.telephone,
      'fax': instance.fax,
      'password': instance.password,
      'salt': instance.salt,
      'address_id': instance.address_id,
      'company_name': instance.company_name,
      'company_address': instance.company_address,
      'approved': instance.approved,
      'safe': instance.safe,
      'token': instance.token,
      'member_upto': instance.member_upto,
      'date_added': instance.date_added,
      'sms_notification': instance.sms_notification,
      'mobile_notification': instance.mobile_notification,
      'email_notification': instance.email_notification,
      'pezesha_status': instance.pezesha_status,
      'pezesha_customer_id': instance.pezesha_customer_id,
      'pezesha_customer_uuid': instance.pezesha_customer_uuid,
      'pezesha_identifier': instance.pezesha_identifier,
      'credit_period': instance.credit_period,
      'devices': instance.devices,
    };
