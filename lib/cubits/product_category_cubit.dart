import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/product_category/product_category.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';



import '../services/api_service/rest_service.dart';

part 'product_category_state.dart';
part 'product_category_cubit.freezed.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  ProductCategoryCubit() : super(ProductCategoryState.initial());

  getProductCategories() async {
    emit(ProductCategoryState.loading());
    try {
      var response = await ApiService.getData(path: '/categories');
      List categoriesMap = response['categories'];
      emit(ProductCategoryState.success(List.generate(categoriesMap.length,
          (index) => ProductCategory.fromJson(categoriesMap[index]))));
    } catch (e) {
      emit(ProductCategoryState.failed(e.toString()));
    }
  }
}
