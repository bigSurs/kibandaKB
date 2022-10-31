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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

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
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call({bool? pinAuth, bool? deviceAuth});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinAuth = freezed,
    Object? deviceAuth = freezed,
  }) {
    return _then(_value.copyWith(
      pinAuth: freezed == pinAuth
          ? _value.pinAuth
          : pinAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceAuth: freezed == deviceAuth
          ? _value.deviceAuth
          : deviceAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPreferencesCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$_UserPreferencesCopyWith(
          _$_UserPreferences value, $Res Function(_$_UserPreferences) then) =
      __$$_UserPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? pinAuth, bool? deviceAuth});
}

/// @nodoc
class __$$_UserPreferencesCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$_UserPreferences>
    implements _$$_UserPreferencesCopyWith<$Res> {
  __$$_UserPreferencesCopyWithImpl(
      _$_UserPreferences _value, $Res Function(_$_UserPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinAuth = freezed,
    Object? deviceAuth = freezed,
  }) {
    return _then(_$_UserPreferences(
      pinAuth: freezed == pinAuth
          ? _value.pinAuth
          : pinAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceAuth: freezed == deviceAuth
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

//Allow PIN Authentication
  @override
  final bool? pinAuth;
//Allow biometrics
  @override
  final bool? deviceAuth;

  @override
  String toString() {
    return 'UserPreferences(pinAuth: $pinAuth, deviceAuth: $deviceAuth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPreferences &&
            (identical(other.pinAuth, pinAuth) || other.pinAuth == pinAuth) &&
            (identical(other.deviceAuth, deviceAuth) ||
                other.deviceAuth == deviceAuth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pinAuth, deviceAuth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPreferencesCopyWith<_$_UserPreferences> get copyWith =>
      __$$_UserPreferencesCopyWithImpl<_$_UserPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPreferencesToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  factory _UserPreferences({final bool? pinAuth, final bool? deviceAuth}) =
      _$_UserPreferences;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$_UserPreferences.fromJson;

  @override //Allow PIN Authentication
  bool? get pinAuth;
  @override //Allow biometrics
  bool? get deviceAuth;
  @override
  @JsonKey(ignore: true)
  _$$_UserPreferencesCopyWith<_$_UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
