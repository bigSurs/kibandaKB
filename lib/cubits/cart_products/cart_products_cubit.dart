import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';


class CartProductMetaDataCubit
 extends HydratedCubit<List<CartProductMetaData>> {
  CartProductMetaDataCubit(List<CartProductMetaData> state) : super(state);
  

   addProduct(
      {required VendorProducts vendorproducts,
      required num amount,
      required int product_id,
      // required int store_product_variation_id,
      // required int store_id,
      //TODO:PICK FROM HERE 
      required Map<String, dynamic> variation 
      }) {
    if (state.contains(CartProductMetaData(
        product_id: int.parse(product.product_id!),
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
            product_id: int.parse(product.product_id!),
            product_note: '',
            amount: amount,
            variation: variation,
            product_store_id: product_store_id,
            store_product_variation_id: store_product_variation_id,
            store_id: store_id)
      ]);
    }
  }
  
  @override
  List<CartProductMetaData>? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
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
    throw UnimplementedError();
  }
  
  @override
  Map<String, dynamic>? toJson(List<CartProductMetaData> state) {
    // TODO: implement toJson
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
    throw UnimplementedError();
  }

}

class CartProductMetaData {
}
final int product_id;
  final int product_store_id;
  final int store_id;
  final int store_product_variation_id;
  String? product_note;
  Map<String, dynamic> variation;

  num amount;

  class CartProductMetaData({
    required this.product_id,
    required this.amount,
    required this.store_id,
    this.product_note,
    required this.product_store_id,
    required this.store_product_variation_id,
    required this.variation,
  });

  setNote({required String note}) {
    this.product_note=note;
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
