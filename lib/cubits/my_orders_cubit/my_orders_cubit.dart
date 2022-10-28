import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/order/order.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'my_orders_state.dart';
part 'my_orders_cubit.freezed.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(MyOrdersState.initial());
  getMyOrders() async {
    emit(MyOrdersState.loading());
    try {
      var response = await ApiService.getDataWithCustomerAuth(
          path: '/customer/order/orders');
      List data = response['data']['orders'];
      emit(MyOrdersState.success(
          List.generate(data.length, (index) => Order.fromJson(data[index]))));
    } catch (e) {
      emit(MyOrdersState.failed(e.toString()));
    }
  }
}
