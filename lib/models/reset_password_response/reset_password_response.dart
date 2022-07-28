// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response.freezed.dart';
part 'reset_password_response.g.dart';

@freezed
class ResetPasswordResponse with _$ResetPasswordResponse {
  factory ResetPasswordResponse(
      {int? delivery_executive_id,
      String? firstname,
      String? lastname,
      String? email,
      String? telephone,
      int? status,
      String? date_added}) = _ResetPasswordResponse;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}
