import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'delivery_timeslot_state.dart';
part 'delivery_timeslot_cubit.freezed.dart';

class DeliveryTimeslotCubit extends Cubit<DeliveryTimeslotState> {
  DeliveryTimeslotCubit() : super(DeliveryTimeslotState.initial());

  getDeliveryTimeslots({required int address_id}) async {
    emit(DeliveryTimeslotState.loading());
    try {
      var response = await ApiService.getData(
          path: 'customer/checkout/deliverytimeslot',
          queries: {
            'store_id': 75,
            'shipping_method': 'store_delivery.store_delivery'
          });
      //Over here
      List dates = response['data']['dates']['timeslots'];
      Map<String, dynamic> timeslots = response['data']['timeslots'];
      List disabledslots = response['data']['disabled_slot'];
      emit(DeliveryTimeslotState.success(
          //TODO: REPLACE WITH ACTUAL MODEL CLASS
          dates: dates,
          slots: timeslots,
          disabledSlots: disabledslots));
    } catch (e) {
      emit(DeliveryTimeslotState.failed(e.toString()));
    }
  }
}
