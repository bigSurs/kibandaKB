// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryTimeSlot _$DeliveryTimeSlotFromJson(Map<String, dynamic> json) {
  return _DeliveryTimeSlot.fromJson(json);
}

/// @nodoc
mixin _$DeliveryTimeSlot {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryTimeSlotCopyWith<$Res> {
  factory $DeliveryTimeSlotCopyWith(
          DeliveryTimeSlot value, $Res Function(DeliveryTimeSlot) then) =
      _$DeliveryTimeSlotCopyWithImpl<$Res, DeliveryTimeSlot>;
}

/// @nodoc
class _$DeliveryTimeSlotCopyWithImpl<$Res, $Val extends DeliveryTimeSlot>
    implements $DeliveryTimeSlotCopyWith<$Res> {
  _$DeliveryTimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DeliveryTimeSlotCopyWith<$Res> {
  factory _$$_DeliveryTimeSlotCopyWith(
          _$_DeliveryTimeSlot value, $Res Function(_$_DeliveryTimeSlot) then) =
      __$$_DeliveryTimeSlotCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeliveryTimeSlotCopyWithImpl<$Res>
    extends _$DeliveryTimeSlotCopyWithImpl<$Res, _$_DeliveryTimeSlot>
    implements _$$_DeliveryTimeSlotCopyWith<$Res> {
  __$$_DeliveryTimeSlotCopyWithImpl(
      _$_DeliveryTimeSlot _value, $Res Function(_$_DeliveryTimeSlot) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryTimeSlot implements _DeliveryTimeSlot {
  _$_DeliveryTimeSlot();

  factory _$_DeliveryTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryTimeSlotFromJson(json);

  @override
  String toString() {
    return 'DeliveryTimeSlot()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeliveryTimeSlot);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryTimeSlotToJson(
      this,
    );
  }
}

abstract class _DeliveryTimeSlot implements DeliveryTimeSlot {
  factory _DeliveryTimeSlot() = _$_DeliveryTimeSlot;

  factory _DeliveryTimeSlot.fromJson(Map<String, dynamic> json) =
      _$_DeliveryTimeSlot.fromJson;
}
