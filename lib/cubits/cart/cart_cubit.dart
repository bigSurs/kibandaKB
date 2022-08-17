import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:collection/collection.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';

class CartCubit extends HydratedCubit<List<VendorProducts>> {
  CartCubit(List<VendorProducts> state) : super(state);
  CartProductMetadataCubit cartProductMetadataCubit =
      GetIt.I<CartProductMetadataCubit>();

  updateCart() async {
    Map<String, dynamic> data = {};
    for (int i = 0; i < state.length; i++) {
      data.addAll({
        'product[$i][product_store_id]': cartProductMetadataCubit.state
            .where((element) => element.product_id == state[i].product_id!)
            .first
            .variation['variant_id']
            .toString(),
        
        'product[$i][store_id]': state[i].store_id.toString(),
        'product[$i][quantity]': cartProductMetadataCubit.state
            .where((element) => element.product_id == state[i].product_id!)
            .first
            .amount
            .toString(),
        'product[$i][store_product_variation_id]': state[i]
            .variations!
            .indexWhere((element) =>
                element['variant_id'] ==
                cartProductMetadataCubit.state
                    .where(
                        (element) => element.product_id == state[i].product_id!)
                    .first
                    .variation['variant_id'])
            .toString()
      });
    }

    // await ApiService.postData(data: data, path: '/customer/cart/cartproduct');÷\
  }

  num getBalance() {
    num sum = 0;

    for (var i = 0; i < state.length; i++) {
      var amount = (cartProductMetadataCubit.state
          .where((element) => element.product_id == state[i].product_id! as int)
          .first
          .amount);
      var variationPrice = (cartProductMetadataCubit.state
          .where((element) => element.product_id == state[i].product_id! as int)
          .first
          .variation['special']);
      sum += ((num.parse(variationPrice)) * amount);
    }
    return sum;
  }

  num getTax() {
    num sum = 0;

    for (var i = 0; i < state.length; i++) {
      var amount = (cartProductMetadataCubit.state
          .where((element) => element.product_id == state[i].product_id!)
          .first
          .amount);
      sum += ((state[i].tax_amount ?? 0) * amount);
    }
    return sum;
  }

  addToCart(
      {required VendorProducts product,
      int amount = 1,
      required Map<String, dynamic> variation}) async {
    if (!state.contains(product)) {
      var items = [...state, product];
      //Record the quantity
      cartProductMetadataCubit.addProduct(
          amount: amount,
          product: product,
          variation: variation!,
          store_id: product.store_id as int ?? 75,
          store_product_variation_id: 0,
          product_store_id: product.product_store_id as int);
      emit(items);
      updateCart();
    } else {
      HapticFeedback.lightImpact();
    }
  }

  removeFromCart({required VendorProducts product}) {
    if (state.contains(product)) {
      cartProductMetadataCubit.removeProduct(
          product: product,
          store_id: product.store_id as int ?? 75,
          store_product_variation_id: 0,
          product_store_id: product.product_store_id! as int,
          amount: cartProductMetadataCubit.state
              .where((element) => element.product_id == product.product_id!)
              .first
              .amount);
      state.remove(product);
      emit(state);

      /// Update the cart on the API
      updateCart();
    } else {
      HapticFeedback.lightImpact();
    }
  }

  plusProducts(VendorProducts product) {
    cartProductMetadataCubit.addProductQuantity(product: product);
    emit(state);
    updateCart();
  }

  minusProducts(VendorProducts product) {
    cartProductMetadataCubit.removeProductQuantity(product: product);
    emit(state);
    updateCart();
  }

  removeAll() {
    emit([]);
    cartProductMetadataCubit.emit([]);
    updateCart();
  }

  @override
  List<VendorProducts>? fromJson(Map<String, dynamic> json) {
    List products = json['cart_products'];
    return List.generate(
        products.length, (index) => VendorProducts.fromJson(products[index]));
  }

  @override
  Map<String, dynamic>? toJson(List<VendorProducts> state) {
    return {
      'cart_products':
          List.generate(state.length, (index) => state[index].toJson())
    };
  }
}
