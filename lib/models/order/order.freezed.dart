// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String? get order_id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get order_status_id => throw _privateConstructorUsedError;
  String? get app_status => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get all_app_order_status =>
      throw _privateConstructorUsedError;
  bool? get shipped => throw _privateConstructorUsedError;
  String? get app_order_status_id => throw _privateConstructorUsedError;
  String? get shippng_method => throw _privateConstructorUsedError;
  String? get order_status => throw _privateConstructorUsedError;
  String? get date_added => throw _privateConstructorUsedError;
  num? get products => throw _privateConstructorUsedError;
  num? get real_products => throw _privateConstructorUsedError;
  String? get sub_total => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;
  String? get order_company => throw _privateConstructorUsedError;
  String? get store_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String? order_id,
      String? status,
      String? order_status_id,
      String? app_status,
      List<Map<String, dynamic>>? all_app_order_status,
      bool? shipped,
      String? app_order_status_id,
      String? shippng_method,
      String? order_status,
      String? date_added,
      num? products,
      num? real_products,
      String? sub_total,
      String? total,
      String? order_company,
      String? store_name});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order_id = freezed,
    Object? status = freezed,
    Object? order_status_id = freezed,
    Object? app_status = freezed,
    Object? all_app_order_status = freezed,
    Object? shipped = freezed,
    Object? app_order_status_id = freezed,
    Object? shippng_method = freezed,
    Object? order_status = freezed,
    Object? date_added = freezed,
    Object? products = freezed,
    Object? real_products = freezed,
    Object? sub_total = freezed,
    Object? total = freezed,
    Object? order_company = freezed,
    Object? store_name = freezed,
  }) {
    return _then(_value.copyWith(
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status_id: freezed == order_status_id
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as String?,
      app_status: freezed == app_status
          ? _value.app_status
          : app_status // ignore: cast_nullable_to_non_nullable
              as String?,
      all_app_order_status: freezed == all_app_order_status
          ? _value.all_app_order_status
          : all_app_order_status // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      shipped: freezed == shipped
          ? _value.shipped
          : shipped // ignore: cast_nullable_to_non_nullable
              as bool?,
      app_order_status_id: freezed == app_order_status_id
          ? _value.app_order_status_id
          : app_order_status_id // ignore: cast_nullable_to_non_nullable
              as String?,
      shippng_method: freezed == shippng_method
          ? _value.shippng_method
          : shippng_method // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status: freezed == order_status
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: freezed == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as num?,
      real_products: freezed == real_products
          ? _value.real_products
          : real_products // ignore: cast_nullable_to_non_nullable
              as num?,
      sub_total: freezed == sub_total
          ? _value.sub_total
          : sub_total // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      order_company: freezed == order_company
          ? _value.order_company
          : order_company // ignore: cast_nullable_to_non_nullable
              as String?,
      store_name: freezed == store_name
          ? _value.store_name
          : store_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? order_id,
      String? status,
      String? order_status_id,
      String? app_status,
      List<Map<String, dynamic>>? all_app_order_status,
      bool? shipped,
      String? app_order_status_id,
      String? shippng_method,
      String? order_status,
      String? date_added,
      num? products,
      num? real_products,
      String? sub_total,
      String? total,
      String? order_company,
      String? store_name});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order_id = freezed,
    Object? status = freezed,
    Object? order_status_id = freezed,
    Object? app_status = freezed,
    Object? all_app_order_status = freezed,
    Object? shipped = freezed,
    Object? app_order_status_id = freezed,
    Object? shippng_method = freezed,
    Object? order_status = freezed,
    Object? date_added = freezed,
    Object? products = freezed,
    Object? real_products = freezed,
    Object? sub_total = freezed,
    Object? total = freezed,
    Object? order_company = freezed,
    Object? store_name = freezed,
  }) {
    return _then(_$_Order(
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status_id: freezed == order_status_id
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as String?,
      app_status: freezed == app_status
          ? _value.app_status
          : app_status // ignore: cast_nullable_to_non_nullable
              as String?,
      all_app_order_status: freezed == all_app_order_status
          ? _value._all_app_order_status
          : all_app_order_status // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      shipped: freezed == shipped
          ? _value.shipped
          : shipped // ignore: cast_nullable_to_non_nullable
              as bool?,
      app_order_status_id: freezed == app_order_status_id
          ? _value.app_order_status_id
          : app_order_status_id // ignore: cast_nullable_to_non_nullable
              as String?,
      shippng_method: freezed == shippng_method
          ? _value.shippng_method
          : shippng_method // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status: freezed == order_status
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: freezed == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as num?,
      real_products: freezed == real_products
          ? _value.real_products
          : real_products // ignore: cast_nullable_to_non_nullable
              as num?,
      sub_total: freezed == sub_total
          ? _value.sub_total
          : sub_total // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      order_company: freezed == order_company
          ? _value.order_company
          : order_company // ignore: cast_nullable_to_non_nullable
              as String?,
      store_name: freezed == store_name
          ? _value.store_name
          : store_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {this.order_id,
      this.status,
      this.order_status_id,
      this.app_status,
      final List<Map<String, dynamic>>? all_app_order_status,
      this.shipped,
      this.app_order_status_id,
      this.shippng_method,
      this.order_status,
      this.date_added,
      this.products,
      this.real_products,
      this.sub_total,
      this.total,
      this.order_company,
      this.store_name})
      : _all_app_order_status = all_app_order_status;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String? order_id;
  @override
  final String? status;
  @override
  final String? order_status_id;
  @override
  final String? app_status;
  final List<Map<String, dynamic>>? _all_app_order_status;
  @override
  List<Map<String, dynamic>>? get all_app_order_status {
    final value = _all_app_order_status;
    if (value == null) return null;
    if (_all_app_order_status is EqualUnmodifiableListView)
      return _all_app_order_status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? shipped;
  @override
  final String? app_order_status_id;
  @override
  final String? shippng_method;
  @override
  final String? order_status;
  @override
  final String? date_added;
  @override
  final num? products;
  @override
  final num? real_products;
  @override
  final String? sub_total;
  @override
  final String? total;
  @override
  final String? order_company;
  @override
  final String? store_name;

  @override
  String toString() {
    return 'Order(order_id: $order_id, status: $status, order_status_id: $order_status_id, app_status: $app_status, all_app_order_status: $all_app_order_status, shipped: $shipped, app_order_status_id: $app_order_status_id, shippng_method: $shippng_method, order_status: $order_status, date_added: $date_added, products: $products, real_products: $real_products, sub_total: $sub_total, total: $total, order_company: $order_company, store_name: $store_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.order_status_id, order_status_id) ||
                other.order_status_id == order_status_id) &&
            (identical(other.app_status, app_status) ||
                other.app_status == app_status) &&
            const DeepCollectionEquality()
                .equals(other._all_app_order_status, _all_app_order_status) &&
            (identical(other.shipped, shipped) || other.shipped == shipped) &&
            (identical(other.app_order_status_id, app_order_status_id) ||
                other.app_order_status_id == app_order_status_id) &&
            (identical(other.shippng_method, shippng_method) ||
                other.shippng_method == shippng_method) &&
            (identical(other.order_status, order_status) ||
                other.order_status == order_status) &&
            (identical(other.date_added, date_added) ||
                other.date_added == date_added) &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.real_products, real_products) ||
                other.real_products == real_products) &&
            (identical(other.sub_total, sub_total) ||
                other.sub_total == sub_total) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.order_company, order_company) ||
                other.order_company == order_company) &&
            (identical(other.store_name, store_name) ||
                other.store_name == store_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      order_id,
      status,
      order_status_id,
      app_status,
      const DeepCollectionEquality().hash(_all_app_order_status),
      shipped,
      app_order_status_id,
      shippng_method,
      order_status,
      date_added,
      products,
      real_products,
      sub_total,
      total,
      order_company,
      store_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  factory _Order(
      {final String? order_id,
      final String? status,
      final String? order_status_id,
      final String? app_status,
      final List<Map<String, dynamic>>? all_app_order_status,
      final bool? shipped,
      final String? app_order_status_id,
      final String? shippng_method,
      final String? order_status,
      final String? date_added,
      final num? products,
      final num? real_products,
      final String? sub_total,
      final String? total,
      final String? order_company,
      final String? store_name}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String? get order_id;
  @override
  String? get status;
  @override
  String? get order_status_id;
  @override
  String? get app_status;
  @override
  List<Map<String, dynamic>>? get all_app_order_status;
  @override
  bool? get shipped;
  @override
  String? get app_order_status_id;
  @override
  String? get shippng_method;
  @override
  String? get order_status;
  @override
  String? get date_added;
  @override
  num? get products;
  @override
  num? get real_products;
  @override
  String? get sub_total;
  @override
  String? get total;
  @override
  String? get order_company;
  @override
  String? get store_name;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
