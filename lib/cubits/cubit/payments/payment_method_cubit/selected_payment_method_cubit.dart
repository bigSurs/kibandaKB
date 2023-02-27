import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/models/payment_method/payment_method.dart';

class SelectedPaymentMethodCubit extends Cubit<PaymentMethod?> {
  SelectedPaymentMethodCubit(PaymentMethod? initialState) : super(initialState);
}
