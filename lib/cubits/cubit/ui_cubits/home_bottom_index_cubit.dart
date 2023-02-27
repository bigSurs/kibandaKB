import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomIndexCubit extends Cubit<int> {
  HomeBottomIndexCubit(int initialState) : super(initialState);
  change(int val) {
    emit(val);
  }
}
