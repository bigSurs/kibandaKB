import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';

part 'place_order_state.dart';
part 'place_order_cubit.freezed.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderState.initial());
  placeOrderMpesa(data) async {
    emit(PlaceOrderState.loading());
    try {
      var response = await RestService().postDataCustomer(
          data: data, path: 'customer/order/mpesacheckoutnew');
      if (response['data']['status']) {
        /// Log the event
        // FirebaseAnalyticsService.logPlaceOrder(totalPrice:data['total'] );
        emit(PlaceOrderState.success());
      } else {
        emit(PlaceOrderState.failed('An error occured'));
      }
    } catch (e) {
      emit(PlaceOrderState.failed(e.toString()));
    }
  }

  placeOrder(data) async {
    emit(PlaceOrderState.loading());
    try {
      var response = await RestService()
          .postDataCustomer(data: data, path: 'customer/order/ordernew');
      if (response['data']['status']) {
        /// Log the event
        // FirebaseAnalyticsService.logPlaceOrder(totalPrice:data['total'] );
        emit(PlaceOrderState.success());
      } else {
        emit(PlaceOrderState.failed('An error occured'));
      }
    } catch (e) {
      emit(PlaceOrderState.failed(e.toString()));
    }
  }
}
