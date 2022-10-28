// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      order_id: json['order_id'] as String?,
      status: json['status'] as String?,
      order_status_id: json['order_status_id'] as String?,
      app_status: json['app_status'] as String?,
      all_app_order_status: (json['all_app_order_status'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      shipped: json['shipped'] as bool?,
      app_order_status_id: json['app_order_status_id'] as String?,
      shippng_method: json['shippng_method'] as String?,
      order_status: json['order_status'] as String?,
      date_added: json['date_added'] as String?,
      products: json['products'] as num?,
      real_products: json['real_products'] as num?,
      sub_total: json['sub_total'] as String?,
      total: json['total'] as String?,
      order_company: json['order_company'] as String?,
      store_name: json['store_name'] as String?,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'order_id': instance.order_id,
      'status': instance.status,
      'order_status_id': instance.order_status_id,
      'app_status': instance.app_status,
      'all_app_order_status': instance.all_app_order_status,
      'shipped': instance.shipped,
      'app_order_status_id': instance.app_order_status_id,
      'shippng_method': instance.shippng_method,
      'order_status': instance.order_status,
      'date_added': instance.date_added,
      'products': instance.products,
      'real_products': instance.real_products,
      'sub_total': instance.sub_total,
      'total': instance.total,
      'order_company': instance.order_company,
      'store_name': instance.store_name,
    };
