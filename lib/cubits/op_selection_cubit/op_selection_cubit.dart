import 'package:flutter_bloc/flutter_bloc.dart';

class OPSelectionCubit extends Cubit<bool> {
  OPSelectionCubit(bool initialState) : super(initialState);
  save(bool s) {
    emit(s);
  }

  toggle() {
    emit(!state);
  }
}
