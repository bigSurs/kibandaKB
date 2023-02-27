import 'package:hydrated_bloc/hydrated_bloc.dart';

class CustomerCookieCubit extends Cubit<String> {
  CustomerCookieCubit(String state) : super(state);

  // var token =
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2NjI0NzkxOTQsImp0aSI6Im9qNVZGVHJRTHRIXC96NCtRanFvdG1oazU1T29vS1oyRFJsR01sZFltdU8wPSIsImlzcyI6InNlcnZlck5hbWUiLCJuYmYiOjE2NjI0NzkxOTQsImV4cCI6MTY3ODI1OTE5NCwiZGF0YSI6eyJpZCI6IjY1MiIsIm5hbWUiOiI3NDYwNTE4MzMifX0.6ezMPOyS0I9u2UURah4AvSchEBO0rvs2tR9WDxXlpfLwbi_rqa8OcZdtIZW-xth5eStP3mWSEVJHMZHJJgn-0g';

  saveToken(String token) {
    emit(token);
  }
}