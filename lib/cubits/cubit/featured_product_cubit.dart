import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';

part 'featured_product_state.dart';
part 'featured_product_cubit.freezed.dart';

class FeaturedProductCubit extends Cubit<FeaturedProductState> {
  FeaturedProductCubit() : super(const FeaturedProductState.initial());

  getFeaturedProducts(BuildContext context) async {
    emit(const FeaturedProductState.loading());
    try {
      var response = await RestService()
          .getData(path: 'customer/products/productsearch', queries: {
        'store_id': 75,
        'search': '',
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
