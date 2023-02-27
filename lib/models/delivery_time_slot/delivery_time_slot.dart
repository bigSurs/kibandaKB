
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_time_slot.freezed.dart';
part 'delivery_time_slot.g.dart';

@freezed
class DeliveryTimeSlot with _$DeliveryTimeSlot {
  factory DeliveryTimeSlot() = _DeliveryTimeSlot;
	
  factory DeliveryTimeSlot.fromJson(Map<String, dynamic> json) =>
			_$DeliveryTimeSlotFromJson(json);
}
