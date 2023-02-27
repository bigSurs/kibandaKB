import 'package:hydrated_bloc/hydrated_bloc.dart';

class RecentlySearchedProductsCubit extends HydratedCubit<List<String>> {
  RecentlySearchedProductsCubit(List<String> state) : super(state);

  @override
  List<String>? fromJson(Map<String, dynamic> json) {
    return json['recently_searched_items'];
  }

  @override
  Map<String, dynamic>? toJson(List<String> state) {
    return {'recently_searched_items': state};
  }
}
