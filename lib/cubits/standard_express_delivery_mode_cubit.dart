import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StandardExpressDeliveryModeCubit extends Cubit<bool> {
  StandardExpressDeliveryModeCubit(bool initialState) : super(initialState);
  toggle(bool val) {
    emit(val);
  }
}
