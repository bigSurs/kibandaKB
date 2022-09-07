// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerTokenModel {
  String get token => throw _privateConstructorUsedError;
  String get cookie => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerTokenModelCopyWith<CustomerTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerTokenModelCopyWith<$Res> {
  factory $CustomerTokenModelCopyWith(
          CustomerTokenModel value, $Res Function(CustomerTokenModel) then) =
      _$CustomerTokenModelCopyWithImpl<$Res>;
  $Res call({String token, String cookie});
}

/// @nodoc
class _$CustomerTokenModelCopyWithImpl<$Res>
    implements $CustomerTokenModelCopyWith<$Res> {
  _$CustomerTokenModelCopyWithImpl(this._value, this._then);

  final CustomerTokenModel _value;
  // ignore: unused_field
  final $Res Function(CustomerTokenModel) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? cookie = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      cookie: cookie == freezed
          ? _value.cookie
          : cookie // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerTokenModelCopyWith<$Res>
    implements $CustomerTokenModelCopyWith<$Res> {
  factory _$$_CustomerTokenModelCopyWith(_$_CustomerTokenModel value,
          $Res Function(_$_CustomerTokenModel) then) =
      __$$_CustomerTokenModelCopyWithImpl<$Res>;
  @override
  $Res call({String token, String cookie});
}

/// @nodoc
class __$$_CustomerTokenModelCopyWithImpl<$Res>
    extends _$CustomerTokenModelCopyWithImpl<$Res>
    implements _$$_CustomerTokenModelCopyWith<$Res> {
  __$$_CustomerTokenModelCopyWithImpl(
      _$_CustomerTokenModel _value, $Res Function(_$_CustomerTokenModel) _then)
      : super(_value, (v) => _then(v as _$_CustomerTokenModel));

  @override
  _$_CustomerTokenModel get _value => super._value as _$_CustomerTokenModel;

  @override
  $Res call({
    Object? token = freezed,
    Object? cookie = freezed,
  }) {
    return _then(_$_CustomerTokenModel(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      cookie: cookie == freezed
          ? _value.cookie
          : cookie // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CustomerTokenModel implements _CustomerTokenModel {
  _$_CustomerTokenModel({required this.token, required this.cookie});

  @override
  final String token;
  @override
  final String cookie;

  @override
  String toString() {
    return 'CustomerTokenModel(token: $token, cookie: $cookie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerTokenModel &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.cookie, cookie));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(cookie));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerTokenModelCopyWith<_$_CustomerTokenModel> get copyWith =>
      __$$_CustomerTokenModelCopyWithImpl<_$_CustomerTokenModel>(
          this, _$identity);
}

abstract class _CustomerTokenModel implements CustomerTokenModel {
  factory _CustomerTokenModel(
      {required final String token,
      required final String cookie}) = _$_CustomerTokenModel;

  @override
  String get token;
  @override
  String get cookie;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerTokenModelCopyWith<_$_CustomerTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
