import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order(
      {String? order_id,
      String? status,
      String? order_status_id,
      String? app_status,
      List<Map<String, dynamic>>? all_app_order_status,
      bool? shipped,
      String? app_order_status_id,
      String? shippng_method,
      String? order_status,
      String? date_added,
      num? products,
      num? real_products,
      String? sub_total,
      String? total,
      String? order_company,
      String? store_name}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
