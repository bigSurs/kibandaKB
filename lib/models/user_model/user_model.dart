// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {String? customer_id,
      String? customer_group_id,
      String? store_id,
      String? firstname,
      String? lastname,
      String? email,
      String? telephone,
      String? fax,
      String? password,
      String? salt,
      String? address_id,
      String? company_name,
      String? company_address,
      String? approved,
      String? safe,
      String? token,
      String? member_upto,
      String? date_added,
      String? sms_notification,
      String? mobile_notification,
      String? email_notification,
      String? pezesha_status,
      String? pezesha_customer_id,
      String? pezesha_customer_uuid,
      String? pezesha_identifier,
      String? credit_period,
      List<Map<String, dynamic>>? devices}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
