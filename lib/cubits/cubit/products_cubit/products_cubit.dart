import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';


part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState.initial());

  searchProducts({required String search}) async {
    emit(ProductsState.loading());
    try {
      var response = await RestService().getDataCustomer(
          path: '/customer/products/productsearch',
          queries: {'search': search, 'store_id': 75});
      List products = response['data']['products'];
      emit(ProductsState.success(
          search: search,
          products: List.generate(
              products.length, (index) => VendorProducts.fromJson(products[index]))));
    } catch (e) {
      emit(ProductsState.failed(e.toString()));
    }
  }

  
}
