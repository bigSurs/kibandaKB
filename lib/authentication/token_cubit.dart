import 'package:hydrated_bloc/hydrated_bloc.dart';

class TokenCubit extends HydratedCubit<String> {
  TokenCubit(String state) : super(state);

  @override
  clear() async {
    emit('');
  }

  saveToken(String token) {
    emit(token);
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['token'];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {'token': state};
  }
}
