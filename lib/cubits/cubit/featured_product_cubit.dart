import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';

part 'featured_product_state.dart';
part 'featured_product_cubit.freezed.dart';

class FeaturedProductCubit extends Cubit<FeaturedProductState> {
  FeaturedProductCubit() : super(const FeaturedProductState.initial());

  getFeaturedProducts({
    required int page,
    required int customerId,
  }) async {
    emit(const FeaturedProductState.loading());
    try {
      var response = await RestService()
          .getDataCustomer(path: 'customer/products', queries: {
        'store_id': 75,
        'search': '',
        // 'page': page,
        'limit': 200,
        'customer_id': customerId,
        'parent': '0',
      });
      List products = response['data']['products'];
      emit(FeaturedProductState.success(
          products: List.generate(products.length,
              (index) => VendorProducts.fromJson(products[index])),
          page: page,
          isLast: false));
    } catch (e) {
      emit(FeaturedProductState.failed(e.toString()));
    }
  }

  Future<List<VendorProducts>> getMore({
    required int page,
    // required int categoryId,
    // required int limit,
    required int customerId,
  }) async {
    var response = await RestService()
        .getDataCustomer(path: 'customer/products', queries: {
      'store_id': '75',
      'customer_id': customerId,
      'search': '',
      // 'page': page +1,
      'limit': 200,
      'parent': '0',
    });
    List products = response['data']['products'];
    var productModels = [
      ...List.generate(
          products.length, (index) => VendorProducts.fromJson(products[index])),
    ];
    return productModels;
  }
}
