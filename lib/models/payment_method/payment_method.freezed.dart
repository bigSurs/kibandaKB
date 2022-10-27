// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String? get code => throw _privateConstructorUsedError;
  String? get terms => throw _privateConstructorUsedError;
  String? get terms1 => throw _privateConstructorUsedError;
  String? get sort_order => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res>;
  $Res call(
      {String? code,
      String? terms,
      String? terms1,
      String? sort_order,
      String? title});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  final PaymentMethod _value;
  // ignore: unused_field
  final $Res Function(PaymentMethod) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? terms = freezed,
    Object? terms1 = freezed,
    Object? sort_order = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      terms: terms == freezed
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as String?,
      terms1: terms1 == freezed
          ? _value.terms1
          : terms1 // ignore: cast_nullable_to_non_nullable
              as String?,
      sort_order: sort_order == freezed
          ? _value.sort_order
          : sort_order // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentMethodCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$_PaymentMethodCopyWith(
          _$_PaymentMethod value, $Res Function(_$_PaymentMethod) then) =
      __$$_PaymentMethodCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? code,
      String? terms,
      String? terms1,
      String? sort_order,
      String? title});
}

/// @nodoc
class __$$_PaymentMethodCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res>
    implements _$$_PaymentMethodCopyWith<$Res> {
  __$$_PaymentMethodCopyWithImpl(
      _$_PaymentMethod _value, $Res Function(_$_PaymentMethod) _then)
      : super(_value, (v) => _then(v as _$_PaymentMethod));

  @override
  _$_PaymentMethod get _value => super._value as _$_PaymentMethod;

  @override
  $Res call({
    Object? code = freezed,
    Object? terms = freezed,
    Object? terms1 = freezed,
    Object? sort_order = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_PaymentMethod(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      terms: terms == freezed
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as String?,
      terms1: terms1 == freezed
          ? _value.terms1
          : terms1 // ignore: cast_nullable_to_non_nullable
              as String?,
      sort_order: sort_order == freezed
          ? _value.sort_order
          : sort_order // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentMethod implements _PaymentMethod {
  _$_PaymentMethod(
      {this.code, this.terms, this.terms1, this.sort_order, this.title});

  factory _$_PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentMethodFromJson(json);

  @override
  final String? code;
  @override
  final String? terms;
  @override
  final String? terms1;
  @override
  final String? sort_order;
  @override
  final String? title;

  @override
  String toString() {
    return 'PaymentMethod(code: $code, terms: $terms, terms1: $terms1, sort_order: $sort_order, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentMethod &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.terms, terms) &&
            const DeepCollectionEquality().equals(other.terms1, terms1) &&
            const DeepCollectionEquality()
                .equals(other.sort_order, sort_order) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(terms),
      const DeepCollectionEquality().hash(terms1),
      const DeepCollectionEquality().hash(sort_order),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentMethodCopyWith<_$_PaymentMethod> get copyWith =>
      __$$_PaymentMethodCopyWithImpl<_$_PaymentMethod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentMethodToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  factory _PaymentMethod(
      {final String? code,
      final String? terms,
      final String? terms1,
      final String? sort_order,
      final String? title}) = _$_PaymentMethod;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$_PaymentMethod.fromJson;

  @override
  String? get code;
  @override
  String? get terms;
  @override
  String? get terms1;
  @override
  String? get sort_order;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentMethodCopyWith<_$_PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
