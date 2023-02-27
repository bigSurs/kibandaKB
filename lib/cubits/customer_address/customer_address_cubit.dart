import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/services.dart';

part 'customer_address_state.dart';
part 'customer_address_cubit.freezed.dart';

class CustomerAddressCubit extends Cubit<CustomerAddressState> {
  CustomerAddressCubit() : super(CustomerAddressState.initial());

  getCustomerAddressById({required int customerId}) async {
    emit(const CustomerAddressState.loading());
    try {
      await ApiService.post(data: {
        'customer_id': customerId,
      }, path: 'customeraddress');
      emit(const CustomerAddressState.success());
    } catch (e) {
      emit( CustomerAddressState.failed(e.toString()));
    }
  }
}
