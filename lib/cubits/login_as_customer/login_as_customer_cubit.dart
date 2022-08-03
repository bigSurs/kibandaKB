import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'login_as_customer_state.dart';
part 'login_as_customer_cubit.freezed.dart';

class LoginAsCustomerCubit extends Cubit<LoginAsCustomerState> {
  LoginAsCustomerCubit() : super(LoginAsCustomerState.initial());

  loggedInCustomer() async {
    emit(const LoginAsCustomerState.loading());
    try {
      var response = await ApiService.postCustomer(
          data: {}, path: 'login/loginascustomer');
      emit(LoginAsCustomerState.success());
    } catch (e) {
      emit(LoginAsCustomerState.failed(e.toString()));
    }
  }
}
