import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTabIndexCubit extends Cubit<int> {
  CategoriesTabIndexCubit(int initialState) : super(initialState);
  change(int val) {
    emit(val);
  }
}
