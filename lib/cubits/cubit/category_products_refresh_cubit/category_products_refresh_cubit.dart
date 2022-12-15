import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_products_refresh_state.dart';
part 'category_products_refresh_cubit.freezed.dart';

class CategoryProductsRefreshCubit extends Cubit<CategoryProductsRefreshState> {
  CategoryProductsRefreshCubit()
      : super(CategoryProductsRefreshState.initial());
  load() {
    emit(CategoryProductsRefreshState.loading());
  }

  reset() {
    emit(CategoryProductsRefreshState.initial());
  }
}
