import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';

class CartCubit extends HydratedCubit<List<VendorProducts>> {
  CartCubit(List<VendorProducts> state) : super(state);
  CartProductMetadataCubit cartProductMetadataCubit =
      GetIt.I<CartProductMetadataCubit>();

  @override
  emit(List<VendorProducts> state) {
    super.emit(state);
    updateCart();
  }

  updateCart() async {
    Map<String, dynamic> data = {};
    for (int i = 0; i < state.length; i++) {
      data.addAll({
        'product[$i][product_store_id]': cartProductMetadataCubit.state
            .where((element) =>
                element.product_id == int.parse(state[i].product_id!))
            .first
            .product_store_id,
        'product[$i][store_id]': '75',
        'product[$i][quantity]': cartProductMetadataCubit.state
            .where((element) =>
                element.product_id == int.parse(state[i].product_id!))
            .first
            .amount
            .toString(),
        'product[$i][store_product_variation_id]': state[i]
            .variations!
            .indexWhere((element) =>
                element['variation_id'] ==
                cartProductMetadataCubit.state
                    .where((element) =>
                        element.product_id == int.parse(state[i].product_id!))
                    .first
                    .variation['variation_id'])
            .toString()
      });
    }

    await RestService()
        .postDataCustomer(data: data, path: 'customer/cart/cartproduct');
  }

  num getBalance() {
    num sum = 0;

    for (var i = 0; i < state.length; i++) {
      var amount = (cartProductMetadataCubit.state
          .where((element) =>
              element.product_id == int.parse(state[i].product_id!))
          .first
          .amount);
      var variationPrice = (cartProductMetadataCubit.state
          .where((element) =>
              (element.product_id) == int.parse(state[i].product_id!))
          .first
          .variation['special_price']);
      sum += ((num.parse(variationPrice)) * amount);
    }
    return sum;
  }

  num getTax() {
    num sum = 0;

    for (var i = 0; i < state.length; i++) {
      var amount = (cartProductMetadataCubit.state
          .where((element) =>
              element.product_id == int.parse(state[i].product_id!))
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
          store_id: 75,
          store_product_variation_id: 0,
          product_store_id: int.parse(product.product_store_id!));
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
          store_id: 75,
          store_product_variation_id: 0,
          product_store_id: int.parse(product.product_store_id!),
          amount: cartProductMetadataCubit.state
              .where((element) =>
                  element.product_id == int.parse(product.product_id!))
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
