import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/payment_method/payment_method.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'payment_method_state.dart';
part 'payment_method_cubit.freezed.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(PaymentMethodState.initial());

  getPaymentMethods(num total) async {
    emit(PaymentMethodState.loading());
    try {
      var response = await ApiService.getDataPayments(
          path: 'customer/checkout/mixedPaymentMethods',
          options: Options(headers: {'X-user': 'customer'}),
          queries: {'total': total});
      Map<String, dynamic> paymentData = response['data']['payment_methods'];
      List<PaymentMethod> paymentMethods = paymentData.entries.map((e) {
        return PaymentMethod.fromJson(e.value);
      }).toList();
      emit(PaymentMethodState.success(paymentMethods));
    } catch (e) {
      emit(PaymentMethodState.failed(e.toString()));
    }
  }
}
