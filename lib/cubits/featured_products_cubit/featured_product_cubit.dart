import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/product/product.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';

part 'featured_product_state.dart';
part 'featured_product_cubit.freezed.dart';

class FeaturedProductCubit extends Cubit<FeaturedProductState> {
  FeaturedProductCubit() : super(FeaturedProductState.initial());

  getFeaturedProducts(BuildContext context) async {
    emit(FeaturedProductState.loading());
    try {
      var response = await RestService()
          .getData(path: '/customer/products/productsearch', queries: {
        'store_id': 75,
        'search': null,
      });
      List products = response['data']['products'];
      emit(FeaturedProductState.success(
          products: List.generate(products.length,
              (index) => VendorProducts.fromJson(products[index]))));
    } catch (e) {
      emit(FeaturedProductState.failed(e.toString()));
    }
  }
}
