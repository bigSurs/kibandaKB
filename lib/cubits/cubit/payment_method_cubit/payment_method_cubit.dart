import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/payment_method/payment_method.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

import 'package:tf_dio_cache/dio_http_cache.dart';
part 'payment_method_state.dart';
part 'payment_method_cubit.freezed.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(PaymentMethodState.initial());

  getPaymentMethods(num total) async {
    emit(PaymentMethodState.loading());
    try {
      var response = await ApiService.getPaymentData(
          path: '/api/customer/checkout/mixedPaymentMethods',
          options: buildCacheOptions(Duration(minutes: 3))
              .copyWith(headers: {'X-User': 'customer'}),
          queries: {'total': total});
      Map<String, dynamic> paymentData = response['data']['payment_methods'];
      if (response['data']['payment_wallet_methods'] != null) {
        PaymentMethod? wallet =
            PaymentMethod.fromJson(response['data']['payment_wallet_methods']);
        List<PaymentMethod> paymentMethods = paymentData.entries.map((e) {
          return PaymentMethod.fromJson(e.value);
        }).toList();
        emit(PaymentMethodState.success([...paymentMethods, wallet]));
      } else {
        List<PaymentMethod> paymentMethods = paymentData.entries.map((e) {
          return PaymentMethod.fromJson(e.value);
        }).toList();
        emit(PaymentMethodState.success([
          ...paymentMethods,
        ]));
      }
    } catch (e) {
      emit(PaymentMethodState.failed(e.toString()));
    }
  }
}
