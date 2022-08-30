import 'package:hydrated_bloc/hydrated_bloc.dart';

class CustomerTokenCubit extends Cubit<String> {
  CustomerTokenCubit(String state) : super(state);



  saveToken(String token) {
    emit(token);
  }

}
