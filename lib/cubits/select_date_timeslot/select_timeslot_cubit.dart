import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTimeslotCubit extends Cubit<String?> {
  SelectTimeslotCubit(String? initialState) : super(initialState);
  change(String date) {
    emit(date);
  }
}
