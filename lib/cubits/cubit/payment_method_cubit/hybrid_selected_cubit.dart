import 'package:flutter_bloc/flutter_bloc.dart';

class HybridSelectedCubit extends Cubit<bool> {
  HybridSelectedCubit() : super(false);
  toggle() {
    emit(!state);
  }
}
