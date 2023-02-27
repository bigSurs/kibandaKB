// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetail _$$_OrderDetailFromJson(Map<String, dynamic> json) =>
    _$_OrderDetail(
      order_id: json['order_id'] as String?,
      invoice_no: json['invoice_no'] as String?,
      store_id: json['store_id'] as String?,
      store_name: json['store_name'] as String?,
      store_url: json['store_url'] as String?,
      customer_id: json['customer_id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      dax: json['dax'] as String?,
      custom_field: json['custom_field'],
      shipping_name: json['shipping_name'] as String?,
      shipping_address: json['shipping_address'] as String?,
      shipping_city: json['shipping_city'] as String?,
      shipping_contact_no: json['shipping_contact_no'] as String?,
      shipping_method: json['shipping_method'] as String?,
      store_details: json['store_details'] as Map<String, dynamic>?,
      paid: json['paid'] as String?,
      delivery_date_formatted: json['delivery_date_formatted'] as String?,
      delivery_timeslot: json['delivery_timeslot'] as String?,
      date_modified: json['date_modified'] as String?,
      eta_date: json['eta_date'] as String?,
      total: json['total'] as String?,
      payment_method: json['payment_method'] as String?,
      shipping_code: json['shipping_code'] as String?,
      shipping_flat_number: json['shipping_flat_number'] as String?,
      order_status: json['order_status'] as String?,
      shipping_landmark: json['shipping_landmark'] as String?,
      shipping_building_name: json['shipping_building_name'] as String?,
      products: json['products'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_OrderDetailToJson(_$_OrderDetail instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'invoice_no': instance.invoice_no,
      'store_id': instance.store_id,
      'store_name': instance.store_name,
      'store_url': instance.store_url,
      'customer_id': instance.customer_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'telephone': instance.telephone,
      'dax': instance.dax,
      'custom_field': instance.custom_field,
      'shipping_name': instance.shipping_name,
      'shipping_address': instance.shipping_address,
      'shipping_city': instance.shipping_city,
      'shipping_contact_no': instance.shipping_contact_no,
      'shipping_method': instance.shipping_method,
      'store_details': instance.store_details,
      'paid': instance.paid,
      'delivery_date_formatted': instance.delivery_date_formatted,
      'delivery_timeslot': instance.delivery_timeslot,
      'date_modified': instance.date_modified,
      'eta_date': instance.eta_date,
      'total': instance.total,
      'payment_method': instance.payment_method,
      'shipping_code': instance.shipping_code,
      'shipping_flat_number': instance.shipping_flat_number,
      'order_status': instance.order_status,
      'shipping_landmark': instance.shipping_landmark,
      'shipping_building_name': instance.shipping_building_name,
      'products': instance.products,
    };
