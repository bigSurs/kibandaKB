// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$ResetPasswordResponseCopyWithImpl<$Res>;
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
class _$ResetPasswordResponseCopyWithImpl<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  _$ResetPasswordResponseCopyWithImpl(this._value, this._then);

  final ResetPasswordResponse _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordResponse) _then;

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
      delivery_executive_id: delivery_executive_id == freezed
          ? _value.delivery_executive_id
          : delivery_executive_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: telephone == freezed
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      date_added: date_added == freezed
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ResetPasswordResponseCopyWith<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  factory _$$_ResetPasswordResponseCopyWith(_$_ResetPasswordResponse value,
          $Res Function(_$_ResetPasswordResponse) then) =
      __$$_ResetPasswordResponseCopyWithImpl<$Res>;
  @override
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
    extends _$ResetPasswordResponseCopyWithImpl<$Res>
    implements _$$_ResetPasswordResponseCopyWith<$Res> {
  __$$_ResetPasswordResponseCopyWithImpl(_$_ResetPasswordResponse _value,
      $Res Function(_$_ResetPasswordResponse) _then)
      : super(_value, (v) => _then(v as _$_ResetPasswordResponse));

  @override
  _$_ResetPasswordResponse get _value =>
      super._value as _$_ResetPasswordResponse;

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
      delivery_executive_id: delivery_executive_id == freezed
          ? _value.delivery_executive_id
          : delivery_executive_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: telephone == freezed
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      date_added: date_added == freezed
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
            const DeepCollectionEquality()
                .equals(other.delivery_executive_id, delivery_executive_id) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.telephone, telephone) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.date_added, date_added));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(delivery_executive_id),
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(telephone),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(date_added));

  @JsonKey(ignore: true)
  @override
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
