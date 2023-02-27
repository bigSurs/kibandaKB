import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/models/user_preferences/user_preferences.dart';

class UserPreferencesCubit extends HydratedCubit<UserPreferences> {
  UserPreferencesCubit(UserPreferences state) : super(state);

  updateSettings(UserPreferences preferences) {
    emit(preferences);
  }

  @override
  Future<void> clear() {
    emit(UserPreferences());
    return super.clear();
  }

  @override
  UserPreferences? fromJson(Map<String, dynamic> json) {
    return UserPreferences.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserPreferences state) {
    return state.toJson();
  }
}
