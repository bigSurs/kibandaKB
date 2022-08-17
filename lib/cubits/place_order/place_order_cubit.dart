import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'place_order_state.dart';
part 'place_order_cubit.freezed.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderState.initial());

  placeOrder(data) async {
    emit(const PlaceOrderState.loading());
    try {
      var response =
          await ApiService.postCustomer(data: {}, path: '/order/ordernew');
      if (response['data']['status']) {
        /// Log the event

        emit(PlaceOrderState.success());
      }
    } catch (e) {
      emit(PlaceOrderState.failed(e.toString()));
    }
  }
}
