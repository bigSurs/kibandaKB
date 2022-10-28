import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail.freezed.dart';
part 'order_detail.g.dart';

@freezed
class OrderDetail with _$OrderDetail {
  factory OrderDetail(
      {String? order_id,
      String? invoice_no,
      String? store_id,
      String? store_name,
      String? store_url,
      String? customer_id,
      String? firstname,
      String? lastname,
      String? email,
      String? telephone,
      String? dax,
      custom_field,
      String? shipping_name,
      String? shipping_address,
      String? shipping_city,
      String? shipping_contact_no,
      String? shipping_method,
      Map<String, dynamic>? store_details,
      String? paid,
      String? delivery_date_formatted,
      String? delivery_timeslot,
      String? date_modified,
      String? eta_date,
      String? total,
      String? payment_method,
      String? shipping_code,
      String? shipping_flat_number,
      String? order_status,
      String? shipping_landmark,
      String? shipping_building_name,
      List? products}) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}
