import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDeliveryDateCubit extends Cubit<String?> {
  SelectDeliveryDateCubit() : super(null);
  change(String e) {
    emit(e);
  }
}
