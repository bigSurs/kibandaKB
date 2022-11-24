import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'transactional_payment_state.dart';
part 'transactional_payment_cubit.freezed.dart';

class TransactionalPaymentCubit extends Cubit<TransactionalPaymentState> {
  TransactionalPaymentCubit() : super(TransactionalPaymentState.initial());

  makeTransactionalPrompts(
      {required int orderId, required String phoneNumber}) async {
    emit(const TransactionalPaymentState.requesting());
    try {
      var response = await ApiService.postDataMpesa(data: {
        'orders[0]': orderId,
        'payment_method': 'mPesa Online',
        'payment_method_code': 'mpesa',
        'mpesa_phonenumber': phoneNumber,
        // 'products':
        //     List.generate(products.length, (index) => products[index].toJson())
      }, path: 'customer/mpesa');
      if (response['status']) {
        emit(const TransactionalPaymentState.requested());
      } else {
        emit(TransactionalPaymentState.failed(response['error']));
      }
    } catch (e) {
      emit(TransactionalPaymentState.failed(e.toString()));
    }
  }

  confirmTransacionalPrompts(Map map, 
      {required int orderId, required String phoneNumber}) async {
    emit(const TransactionalPaymentState.confirming());
    try {
      var response = await ApiService.postDataMpesa(data: {
        'orders[0]': orderId,
        'payment_method': 'mPesa Online',
        'payment_method_code': 'mpesa',
        'mpesa_phonenumber': phoneNumber,
        // 'products':
        //     List.generate(products.length, (index) => products[index].toJson())
      }, path: 'customer/mpesa');

      if (response['status']) {
        emit(TransactionalPaymentState.confirmed());
      } else {
        emit(TransactionalPaymentState.failed(response['error']));
      }
    } catch (e) {
      emit(TransactionalPaymentState.failed(e.toString()));
    }
  }
}
