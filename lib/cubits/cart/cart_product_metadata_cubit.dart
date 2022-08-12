import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';

class CartProductMetadataCubit
    extends HydratedCubit<List<CartProductMetaData>> {
  CartProductMetadataCubit(List<CartProductMetaData> state) : super(state);

  addProduct(
      {required VendorProducts product,
      required num amount,
      required int product_store_id,
      required int store_product_variation_id,
      required int store_id,
      required Map<String, dynamic> variation}) {
    if (state.contains(CartProductMetaData(
        product_id: product.product_id!,
        amount: amount,
        product_note: '',
        variation: variation,
        product_store_id: product_store_id,
        store_product_variation_id: store_product_variation_id,
        store_id: store_id))) {
      addProductQuantity(product: product);
    } else {
      emit([
        ...state,
        CartProductMetaData(
            product_id: product.product_id!,
            product_note: '',
            amount: amount,
            variation: variation,
            product_store_id: product_store_id,
            store_product_variation_id: store_product_variation_id,
            store_id: store_id)
      ]);
    }
  }

  removeProduct(
      {required VendorProducts product,
      required num amount,
      required int product_store_id,
      required int store_product_variation_id,
      required int store_id}) {
    if (state.contains(CartProductMetaData(
        product_id: product.product_id!,
        amount: amount,
        variation: product.variations!
            .where(
                (element) => element['variant_id'] == product.product_store_id)
            .first,
        product_store_id: product_store_id,
        store_product_variation_id: store_product_variation_id,
        store_id: store_id))) {
      var currentState = state;
      currentState
          .removeWhere((element) => element.product_id == product.product_id!);
    } else {
      HapticFeedback.lightImpact();
    }
  }

  addProductQuantity({
    required VendorProducts product,
  }) {
    var currentState = state;

    currentState
        .where((element) => element.product_id == product.product_id!)
        .first
        .add();
    emit(currentState);
  }

  setVariation({
    required VendorProducts product,
    required Map<String, dynamic> vary,
  }) {
    var currentState = state;

    currentState
        .where((element) => element.product_id == product.product_id!)
        .first
        .setVariation(vary: vary);
    emit(currentState);
  }

  setNotes({
    required VendorProducts product,
    required String? notes,
  }) {
    var currentState = state;

    currentState
        .where((element) => element.product_id == product.product_id!)
        .first
        .setNote(note: notes!);
    emit(currentState);
  }

  removeProductQuantity({
    required VendorProducts product,
  }) {
    var currentState = state;

    currentState
        .where((element) => element.product_id == product.product_id!)
        .first
        .remove();
    emit(currentState);
  }

  setProductQuantity({required VendorProducts product, required num quantity}) {
    var currentState = state;

    currentState
        .where((element) => element.product_id == product.product_id!)
        .first
        .set(quantity);
    emit(currentState);
  }

  @override
  List<CartProductMetaData>? fromJson(Map<String, dynamic> json) {
    List val = json['value'];
    return List.generate(
        val.length,
        (index) => CartProductMetaData(
            product_id: val[index]['product_id'],
            amount: val[index]['amount'],
            product_note: val[index]['product_note'],
            product_store_id: val[index]['product_store_id'],
            store_id: val[index]['store_id'],
            variation: val[index]['variation'],
            store_product_variation_id: val[index]
                ['store_product_variation_id']));
  }

  @override
  Map<String, dynamic>? toJson(List<CartProductMetaData> state) {
    return {
      'value': List.generate(
          state.length,
          (index) => {
                'product_id': state[index].product_id,
                'amount': state[index].amount,
                'variation': state[index].variation,
                'product_store_id': state[index].product_store_id,
                'store_id': state[index].store_id,
                'store_product_variation_id':
                    state[index].store_product_variation_id,
              })
    };
  }
}

class CartProductMetaData {
  final int product_id;
  final int product_store_id;
  final int store_id;
  final int store_product_variation_id;
  String? product_note;
  Map<String, dynamic> variation;

  num amount;

  CartProductMetaData({
    required this.product_id,
    required this.amount,
    required this.store_id,
    this.product_note,
    required this.product_store_id,
    required this.store_product_variation_id,
    required this.variation,
  });

  setNote({required String note}) {
    this.product_note = note;
  }

  setVariation({required Map<String, dynamic> vary}) {
    this.variation = vary;
  }

  num total() {
    return amount * num.parse(variation['special']);
  }

  add() {
    this.amount++;
  }

  remove() {
    if (amount >= 1) {
      amount--;
    } else {
      HapticFeedback.lightImpact();
    }
  }

  set(num val) {
    if (val != null) {
      amount = val;
    } else {
      HapticFeedback.lightImpact();
    }
  }
}
