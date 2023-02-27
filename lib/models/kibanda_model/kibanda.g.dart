// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kibanda.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Kibanda _$$_KibandaFromJson(Map<String, dynamic> json) => _$_Kibanda(
      customer_id: json['customer_id'] as num?,
      customer_group_id: json['customer_group_id'] as num?,
      store_id: json['store_id'] as num?,
      token: json['token'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      fax: json['fax'] as String?,
      password: json['password'] as String?,
      salt: json['salt'] as String?,
      cart: json['cart'] as String?,
      payment_terms: json['payment_terms'] as String?,
      address_id: json['address_id'] as int?,
      company_name: json['company_name'] as String?,
      company_address: json['company_address'] as String?,
      customer_category: json['customer_category'] as String?,
    );

Map<String, dynamic> _$$_KibandaToJson(_$_Kibanda instance) =>
    <String, dynamic>{
      'customer_id': instance.customer_id,
      'customer_group_id': instance.customer_group_id,
      'store_id': instance.store_id,
      'token': instance.token,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'telephone': instance.telephone,
      'fax': instance.fax,
      'password': instance.password,
      'salt': instance.salt,
      'cart': instance.cart,
      'payment_terms': instance.payment_terms,
      'address_id': instance.address_id,
      'company_name': instance.company_name,
      'company_address': instance.company_address,
      'customer_category': instance.customer_category,
    };
