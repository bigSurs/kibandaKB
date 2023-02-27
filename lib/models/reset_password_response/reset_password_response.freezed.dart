// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPasswordResponse _$ResetPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _ResetPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordResponse {
  int? get delivery_executive_id => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get date_added => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordResponseCopyWith<ResetPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordResponseCopyWith<$Res> {
  factory $ResetPasswordResponseCopyWith(ResetPasswordResponse value,
          $Res Function(ResetPasswordResponse) then) =
      _$ResetPasswordResponseCopyWithImpl<$Res, ResetPasswordResponse>;
  @useResult
  $Res call(
      {int? delivery_executive_id,
      String? firstname,
      String? lastname,
      String? email,
      String? telephone,
      int? status,
      String? date_added});
}

/// @nodoc
class _$ResetPasswordResponseCopyWithImpl<$Res,
        $Val extends ResetPasswordResponse>
    implements $ResetPasswordResponseCopyWith<$Res> {
  _$ResetPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivery_executive_id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? telephone = freezed,
    Object? status = freezed,
    Object? date_added = freezed,
  }) {
    return _then(_value.copyWith(
      delivery_executive_id: freezed == delivery_executive_id
          ? _value.delivery_executive_id
          : delivery_executive_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      date_added: freezed == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordResponseCopyWith<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  factory _$$_ResetPasswordResponseCopyWith(_$_ResetPasswordResponse value,
          $Res Function(_$_ResetPasswordResponse) then) =
      __$$_ResetPasswordResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? delivery_executive_id,
      String? firstname,
      String? lastname,
      String? email,
      String? telephone,
      int? status,
      String? date_added});
}

/// @nodoc
class __$$_ResetPasswordResponseCopyWithImpl<$Res>
    extends _$ResetPasswordResponseCopyWithImpl<$Res, _$_ResetPasswordResponse>
    implements _$$_ResetPasswordResponseCopyWith<$Res> {
  __$$_ResetPasswordResponseCopyWithImpl(_$_ResetPasswordResponse _value,
      $Res Function(_$_ResetPasswordResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivery_executive_id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? telephone = freezed,
    Object? status = freezed,
    Object? date_added = freezed,
  }) {
    return _then(_$_ResetPasswordResponse(
      delivery_executive_id: freezed == delivery_executive_id
          ? _value.delivery_executive_id
          : delivery_executive_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      date_added: freezed == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPasswordResponse implements _ResetPasswordResponse {
  _$_ResetPasswordResponse(
      {this.delivery_executive_id,
      this.firstname,
      this.lastname,
      this.email,
      this.telephone,
      this.status,
      this.date_added});

  factory _$_ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPasswordResponseFromJson(json);

  @override
  final int? delivery_executive_id;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? email;
  @override
  final String? telephone;
  @override
  final int? status;
  @override
  final String? date_added;

  @override
  String toString() {
    return 'ResetPasswordResponse(delivery_executive_id: $delivery_executive_id, firstname: $firstname, lastname: $lastname, email: $email, telephone: $telephone, status: $status, date_added: $date_added)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordResponse &&
            (identical(other.delivery_executive_id, delivery_executive_id) ||
                other.delivery_executive_id == delivery_executive_id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date_added, date_added) ||
                other.date_added == date_added));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, delivery_executive_id, firstname,
      lastname, email, telephone, status, date_added);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordResponseCopyWith<_$_ResetPasswordResponse> get copyWith =>
      __$$_ResetPasswordResponseCopyWithImpl<_$_ResetPasswordResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPasswordResponseToJson(
      this,
    );
  }
}

abstract class _ResetPasswordResponse implements ResetPasswordResponse {
  factory _ResetPasswordResponse(
      {final int? delivery_executive_id,
      final String? firstname,
      final String? lastname,
      final String? email,
      final String? telephone,
      final int? status,
      final String? date_added}) = _$_ResetPasswordResponse;

  factory _ResetPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$_ResetPasswordResponse.fromJson;

  @override
  int? get delivery_executive_id;
  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get email;
  @override
  String? get telephone;
  @override
  int? get status;
  @override
  String? get date_added;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordResponseCopyWith<_$_ResetPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
