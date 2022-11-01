import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/order/order.dart';
import 'package:kibanda_kb/models/order/order_detail.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

import '../../utilities/rest_client/rest_client.dart';

part 'order_details_state.dart';
part 'order_details_cubit.freezed.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsState.initial());
  getOrderDetails(Order order) async {
    emit(OrderDetailsState.loading());
    try {
      var response = await ApiService.getDataNoAuth(
          path: 'orders/order',
          queries: {'id': order.order_id},
          options: Options(headers: {
            'Authorization': 'Basic YXBpYWRtaW46S3dpayRBZG1pbiMyMDIw'
          }));
      emit(OrderDetailsState.success(OrderDetail.fromJson(response)));
    } catch (e) {
      emit(OrderDetailsState.failed(e.toString()));
    }
  }
}
