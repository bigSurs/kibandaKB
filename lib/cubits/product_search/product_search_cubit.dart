import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'product_search_state.dart';
part 'product_search_cubit.freezed.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  ProductSearchCubit() : super(ProductSearchState.initial());


  searchProducts({required String search}) async {
    emit(ProductSearchState.loading());
    try {
      var response = await ApiService.getData(
          path: '/customer/products/productsearch',
          queries: {'search': search, 'store_id': 75});
      List products = response['data']['products'];
      emit(ProductSearchState.success(
          search: search,
          products: List.generate(
              products.length, (index) => VendorProducts.fromJson(products[index]))));
    } catch (e) {
      emit(ProductSearchState.failed(e.toString()));
    }
  }
}
