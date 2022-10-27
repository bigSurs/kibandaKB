import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';


part 'lipa_na_mpesa_state.dart';
part 'lipa_na_mpesa_cubit.freezed.dart';

class LipaNaMpesaCubit extends Cubit<LipaNaMpesaState> {
  LipaNaMpesaCubit() : super(LipaNaMpesaState.initial());

  lipaNaMpesa(data) async {
    emit(LipaNaMpesaState.requesting());
    try {
      var response = await ApiService.postData(
          data: data, path: '/customer/mpesa/mpesacheckout');
      if (response['status']) {
        emit(LipaNaMpesaState.requested());
      } else {
        emit(LipaNaMpesaState.failed(response['error']));
      }
    } catch (e) {
      emit(LipaNaMpesaState.failed(e.toString()));
    }
  }

  confirmMpesa(data) async {
    emit(LipaNaMpesaState.confirming());
    try {
      var response = await ApiService.postData(
          data: data, path: '/customer/mpesa/mpesacheckoutcomplete');

      if (response['status']) {
        emit(LipaNaMpesaState.confirmed());
      } else {
        emit(LipaNaMpesaState.failed(response['error']));
      }
    } catch (e) {
      emit(LipaNaMpesaState.failed(e.toString()));
    }
  }
}
