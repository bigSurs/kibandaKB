import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionIndexCubit extends Cubit<int> {
  TransactionIndexCubit(int initialState) : super(initialState);
  change(int val) {
    emit(val);
  }
}
