import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_token_model.freezed.dart';

@freezed
class CustomerTokenModel with _$CustomerTokenModel {
  factory CustomerTokenModel({required String token, required String cookie}) =
      _CustomerTokenModel;
}
