// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wishlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wishlist _$WishlistFromJson(Map<String, dynamic> json) {
  return _Wishlist.fromJson(json);
}

/// @nodoc
mixin _$Wishlist {
  String? get name => throw _privateConstructorUsedError;
  String? get wishlist_id => throw _privateConstructorUsedError;
  String? get date_added => throw _privateConstructorUsedError;
  int? get product_count => throw _privateConstructorUsedError;
  List<dynamic>? get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishlistCopyWith<Wishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistCopyWith<$Res> {
  factory $WishlistCopyWith(Wishlist value, $Res Function(Wishlist) then) =
      _$WishlistCopyWithImpl<$Res, Wishlist>;
  @useResult
  $Res call(
      {String? name,
      String? wishlist_id,
      String? date_added,
      int? product_count,
      List<dynamic>? products});
}

/// @nodoc
class _$WishlistCopyWithImpl<$Res, $Val extends Wishlist>
    implements $WishlistCopyWith<$Res> {
  _$WishlistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? wishlist_id = freezed,
    Object? date_added = freezed,
    Object? product_count = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      wishlist_id: freezed == wishlist_id
          ? _value.wishlist_id
          : wishlist_id // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: freezed == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      product_count: freezed == product_count
          ? _value.product_count
          : product_count // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WishlistCopyWith<$Res> implements $WishlistCopyWith<$Res> {
  factory _$$_WishlistCopyWith(
          _$_Wishlist value, $Res Function(_$_Wishlist) then) =
      __$$_WishlistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? wishlist_id,
      String? date_added,
      int? product_count,
      List<dynamic>? products});
}

/// @nodoc
class __$$_WishlistCopyWithImpl<$Res>
    extends _$WishlistCopyWithImpl<$Res, _$_Wishlist>
    implements _$$_WishlistCopyWith<$Res> {
  __$$_WishlistCopyWithImpl(
      _$_Wishlist _value, $Res Function(_$_Wishlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? wishlist_id = freezed,
    Object? date_added = freezed,
    Object? product_count = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_Wishlist(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      wishlist_id: freezed == wishlist_id
          ? _value.wishlist_id
          : wishlist_id // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: freezed == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      product_count: freezed == product_count
          ? _value.product_count
          : product_count // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wishlist implements _Wishlist {
  _$_Wishlist(
      {this.name,
      this.wishlist_id,
      this.date_added,
      this.product_count,
      final List<dynamic>? products})
      : _products = products;

  factory _$_Wishlist.fromJson(Map<String, dynamic> json) =>
      _$$_WishlistFromJson(json);

  @override
  final String? name;
  @override
  final String? wishlist_id;
  @override
  final String? date_added;
  @override
  final int? product_count;
  final List<dynamic>? _products;
  @override
  List<dynamic>? get products {
    final value = _products;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Wishlist(name: $name, wishlist_id: $wishlist_id, date_added: $date_added, product_count: $product_count, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wishlist &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.wishlist_id, wishlist_id) ||
                other.wishlist_id == wishlist_id) &&
            (identical(other.date_added, date_added) ||
                other.date_added == date_added) &&
            (identical(other.product_count, product_count) ||
                other.product_count == product_count) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, wishlist_id, date_added,
      product_count, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishlistCopyWith<_$_Wishlist> get copyWith =>
      __$$_WishlistCopyWithImpl<_$_Wishlist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishlistToJson(
      this,
    );
  }
}

abstract class _Wishlist implements Wishlist {
  factory _Wishlist(
      {final String? name,
      final String? wishlist_id,
      final String? date_added,
      final int? product_count,
      final List<dynamic>? products}) = _$_Wishlist;

  factory _Wishlist.fromJson(Map<String, dynamic> json) = _$_Wishlist.fromJson;

  @override
  String? get name;
  @override
  String? get wishlist_id;
  @override
  String? get date_added;
  @override
  int? get product_count;
  @override
  List<dynamic>? get products;
  @override
  @JsonKey(ignore: true)
  _$$_WishlistCopyWith<_$_Wishlist> get copyWith =>
      throw _privateConstructorUsedError;
}
