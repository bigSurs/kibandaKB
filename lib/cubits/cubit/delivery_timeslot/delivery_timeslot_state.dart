part of 'delivery_timeslot_cubit.dart';

@freezed
class DeliveryTimeslotState with _$DeliveryTimeslotState {
  const factory DeliveryTimeslotState.initial() = _Initial;
  const factory DeliveryTimeslotState.loading() = _Loading;
  const factory DeliveryTimeslotState.success({required List dates,required Map<String, dynamic> slots,required List disabledSlots}) = _Success;
  const factory DeliveryTimeslotState.failed(String erroe) = _Failed;
}
