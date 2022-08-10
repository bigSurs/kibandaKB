import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDeliveryDateCubit extends Cubit<String?> {
  SelectDeliveryDateCubit(String? initialState) : super(initialState);
  change(String e) {
    emit(e);
  }
}
