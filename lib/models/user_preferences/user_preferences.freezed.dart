// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
class _$UserPreferencesTearOff {
  const _$UserPreferencesTearOff();

  _UserPreferences call({bool? pinAuth, bool? deviceAuth}) {
    return _UserPreferences(
      pinAuth: pinAuth,
      deviceAuth: deviceAuth,
    );
  }

  UserPreferences fromJson(Map<String, Object?> json) {
    return UserPreferences.fromJson(json);
  }
}

/// @nodoc
const $UserPreferences = _$UserPreferencesTearOff();

/// @nodoc
mixin _$UserPreferences {
//Allow PIN Authentication
  bool? get pinAuth => throw _privateConstructorUsedError; //Allow biometrics
  bool? get deviceAuth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res>;
  $Res call({bool? pinAuth, bool? deviceAuth});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  final UserPreferences _value;
  // ignore: unused_field
  final $Res Function(UserPreferences) _then;

  @override
  $Res call({
    Object? pinAuth = freezed,
    Object? deviceAuth = freezed,
  }) {
    return _then(_value.copyWith(
      pinAuth: pinAuth == freezed
          ? _value.pinAuth
          : pinAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceAuth: deviceAuth == freezed
          ? _value.deviceAuth
          : deviceAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UserPreferencesCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(
          _UserPreferences value, $Res Function(_UserPreferences) then) =
      __$UserPreferencesCopyWithImpl<$Res>;
  @override
  $Res call({bool? pinAuth, bool? deviceAuth});
}

/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(
      _UserPreferences _value, $Res Function(_UserPreferences) _then)
      : super(_value, (v) => _then(v as _UserPreferences));

  @override
  _UserPreferences get _value => super._value as _UserPreferences;

  @override
  $Res call({
    Object? pinAuth = freezed,
    Object? deviceAuth = freezed,
  }) {
    return _then(_UserPreferences(
      pinAuth: pinAuth == freezed
          ? _value.pinAuth
          : pinAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceAuth: deviceAuth == freezed
          ? _value.deviceAuth
          : deviceAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPreferences implements _UserPreferences {
  _$_UserPreferences({this.pinAuth, this.deviceAuth});

  factory _$_UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$$_UserPreferencesFromJson(json);

  @override //Allow PIN Authentication
  final bool? pinAuth;
  @override //Allow biometrics
  final bool? deviceAuth;

  @override
  String toString() {
    return 'UserPreferences(pinAuth: $pinAuth, deviceAuth: $deviceAuth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserPreferences &&
            const DeepCollectionEquality().equals(other.pinAuth, pinAuth) &&
            const DeepCollectionEquality()
                .equals(other.deviceAuth, deviceAuth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pinAuth),
      const DeepCollectionEquality().hash(deviceAuth));

  @JsonKey(ignore: true)
  @override
  _$UserPreferencesCopyWith<_UserPreferences> get copyWith =>
      __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPreferencesToJson(this);
  }
}

abstract class _UserPreferences implements UserPreferences {
  factory _UserPreferences({bool? pinAuth, bool? deviceAuth}) =
      _$_UserPreferences;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$_UserPreferences.fromJson;

  @override //Allow PIN Authentication
  bool? get pinAuth;
  @override //Allow biometrics
  bool? get deviceAuth;
  @override
  @JsonKey(ignore: true)
  _$UserPreferencesCopyWith<_UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
