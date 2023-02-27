import 'package:hydrated_bloc/hydrated_bloc.dart';

class SessionCubit extends HydratedCubit<String> {
  SessionCubit(String state) : super(state);

  saveSession(String Session) {
    emit(Session);
  }

  @override
  Future<void> clear() {
    emit('');
    return super.clear();
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['session'];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {'session': state};
  }
}
