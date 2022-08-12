import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';


part 'validate_order_state.dart';
part 'validate_order_cubit.freezed.dart';

class ValidateOrderCubit extends Cubit<ValidateOrderState> {
  ValidateOrderCubit() : super(ValidateOrderState.initial());

  validateOrder({required data}) async {
    emit(ValidateOrderState.loading());
    try {
      var response = await ApiService.postData(
          data: data, path: 'customer/order/validateOrder');
      if (response["status"] == 200) {
        emit(ValidateOrderState.success());
      } else {
        emit(ValidateOrderState.failed(response['error_message']));
      }
    } catch (e) {
      emit(ValidateOrderState.failed(e.toString()));
    }
  }
}
