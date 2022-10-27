// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:kibanda_kb/app/alert/alert.dart';
// import 'package:kibanda_kb/constants/constants.dart';
// import 'package:kibanda_kb/helper/apiHelper.dart';
// import 'package:kibanda_kb/helper/dbHelper.dart';
// import 'package:kibanda_kb/local/app_single_tone.dart';
// import 'package:kibanda_kb/main.dart';
// import 'package:collection/collection.dart'; 
// import 'package:kibanda_kb/models/cart_model/cart_model.dart';


// class CartProvider with ChangeNotifier {
//   List<CartModel> list = [];
//   num cartTotal = 0;
//   num cartSubtotal = 0;
//   num cartTax = 0;
//   String taxName = "";

//   Future<void> addToCart(CartModel cartProduct) async {
//     int result = await DBHelper.insert(
//         Constants.cartTableName, CartModel.toJson(cartProduct));

//     if (result != null && result > 0) {
//       cartProduct.id = result;
//       this.list.add(cartProduct);
//       eventBus.fire("updateCart");
//       cartTotalCalculate();

//       addToCartApi();
//     }
//   }

//   Future<void> removeFromCart(CartModel cartProduct) async {
//     int result =
//         await DBHelper.removeById(Constants.cartTableName, cartProduct.id!);

//     eventBus.fire("updateCart");

//     if (result > 0) {
//       this.list.removeWhere((element) => element.id == cartProduct.id);
//       cartTotalCalculate();
//       addToCartApi();
//     }
//   }

//   Future<void> updateCartProduct(
//     String productStoreId,
//     CartModel cartProduct,
//   ) async {
//     var obj = this
//         .list
//         .firstWhere((element) => element.productStoreId == productStoreId);

//     obj.notes = cartProduct.notes;
//     obj.qty = cartProduct.qty;
//     obj.type = cartProduct.type;
//     obj.total = cartProduct.total;

//     int result = await DBHelper.updateCart(
//         Constants.cartTableName, CartModel.toJson(obj), obj.id!);
//     notifyListeners();
//     if (result > 0) {
//       eventBus.fire("updateCart");

//       cartTotalCalculate();
//       addToCartApi();
//     }
//     cartTotalCalculate();
//   }

//   CartModel? getCartProductById(String id) {
//     if (this.list.length != 0) {
//       // return list.where((element) => true).first
//       return list.firstWhereOrNull(
//         (element) => element.productStoreId == id,
//       );
//     }
//     cartTotalCalculate();
//   }

//   Future<void> fetchCartItemFromDB() async {
//     List<CartModel> cartDbList = [];
//     final data = await DBHelper.getData(Constants.cartTableName);

//     cartDbList = data.map((item) {
//       return CartModel.fromJson(item);
//     }).toList();

//     this.list = cartDbList;
//     cartTotalCalculate();
//   }

//   void cartTotalCalculate() {
//     this.cartTotal = 0;
//     this.cartSubtotal = 0;
//     this.cartTax = 0;
//     this.list.forEach((element) {
//       cartTax += (element.qty! * element.tax!);
//       if (element.discount_price != null) {
//         cartSubtotal += (element.qty! * element.discount_price!);
//       } else {
//         cartSubtotal += (element.qty! * element.productPrice!);
//       }
//       cartTotal += element.total!;
//       taxName = element.taxName ?? '';
//     });
//     notifyListeners();
//   }

//   Future<void> addToCartApi() async {
//     var products = {};
//     for (int i = 0; i < this.list.length; i++) {
//       List<String> str = [];
//       this.list[i].type!.forEach((key, value) {
//         str.add("$key-$value");
//       });
//       print(this.list[i].storeId.toString());
//       print(this.list[i].variantName.toString());

//       products.addAll({
//         'product[$i][product_store_id]': this.list[i].productStoreId.toString(),
//         'product[$i][quantity]': this.list[i].qty.toString(),
//         'product[$i][unit]': this.list[i].variantName,
//         'product[$i][store_id]': this.list[i].storeId.toString(),
//         'product[$i][store_product_variation_id]': "0",
//         'product[$i][product_type]': "replaceable",
//         'product[$i][product_note]': this.list[i].notes,
//         'product[$i][produce_type]': str.join(","),
//       });
//     }

//     print(products);
//     cartTotalCalculate();
//     var header = APIRoutes.x_user_header;
//     header.addAll({"Cookie": 'PHPSESSID=${AppSingleTone().cartSessionId}'});

//     print(header);
//     var response = await APIHelper.api(
//         APIRoutes.api_post_add_cart, products, APIHelperMethod.POST,
//         header: header);
//     print("hello");
//     print(response);
//     var sessionId = response["session_id"];
//     print(sessionId);

//     await AppSingleTone().setCartSessionId(sessionId);
//     if (response != null && response["status"] == 200) {
//       updateFromCartAPi();
//     }
//     cartTotalCalculate();
//   }

//   Future<void> updateFromCartAPi() async {
//     var header = APIRoutes.x_user_header;
//     header.addAll({"Cookie": 'PHPSESSID=${AppSingleTone().cartSessionId}'});
//     var response = await APIHelper.api(
//         APIRoutes.api_get_cart_list, {}, APIHelperMethod.GET,
//         header: header);

//     if (response["status"] == 200 && !(response["products"] is List)) {
//       var products = response["products"];
//       products.keys.forEach(
//         (element) async {
//           var cartProduct = CartModel.fromAPI(products[element]);

//           APIRoutes.storeName = cartProduct.storeName!;
//           int result = await DBHelper.updateCartByProductId(
//               Constants.cartTableName,
//               CartModel.toJson(cartProduct),
//               cartProduct.productStoreId!);

//           int index = this.list.indexWhere((element) =>
//               element.productStoreId == cartProduct.productStoreId);

//           if (result != null && result > 0) {
//             if (index != -1) {
//               var obj = list.removeAt(index);
//               cartProduct.id = obj.id;
//               list.insert(index, cartProduct);
//             }
//             eventBus.fire("updateCart");
//             cartTotalCalculate();
//           }
//         },
//       );
//       notifyListeners();
//     } else {
//       this.clear();
//     }
//   }

//   Future<void> addToCartWishList(products) async {
//     var header = APIRoutes.x_user_header;
//     header.addAll({"Cookie": 'PHPSESSID=${AppSingleTone().cartSessionId}'});
//     var response = await APIHelper.api(
//         APIRoutes.api_post_add_cart, products, APIHelperMethod.POST,
//         header: header);

//     var sessionId = response["session_id"];
//     await AppSingleTone().setCartSessionId(sessionId);
//     if (response != null && response["status"] == 200) {
//       await getFromCartAPi();
//     }
//   }

//   Future<void> getFromCartAPi() async {
//     await AppSingleTone().getCartSessionId();
//     var header = APIRoutes.x_user_header;
//     header.addAll({"Cookie": 'PHPSESSID=${AppSingleTone().cartSessionId}'});
//     var response = await APIHelper.api(
//         APIRoutes.api_get_cart_list, {}, APIHelperMethod.GET,
//         header: header);
//     log('cccccccccccccccccccccccccccccccccccc$response');

//     if (response["status"] == 200) {
//       Map<String, dynamic> products = response["products"];

//       List<String> cartIds = [];

//       this.list.forEach((element) {
//         cartIds.add(element.productId!);
//       });

//       products.keys.forEach(
//         (element) async {
//           var cartProduct = CartModel.fromAPI(products[element]);

//           if (!cartIds.contains(cartProduct.productId)) {
//             int result = await DBHelper.insert(
//                 Constants.cartTableName, CartModel.toJson(cartProduct));

//             if (result != null && result > 0) {
//               cartProduct.id = result;
//               this.list.add(cartProduct);
//               eventBus.fire("updateCart");
//               cartTotalCalculate();
//             }
//           }
//         },
//       );
//       notifyListeners();
//     }
//   }

//   Future<bool> validateOrder() async {
//     var products = {};

//     for (int i = 0; i < this.list.length; i++) {
//       products.addAll({
//         'products[$i][quantity]': this.list[i].qty.toString(),
//         'products[$i][product_store_id]':
//             this.list[i].productStoreId.toString(),
//         'products[$i][store_id]': this.list[i].storeId.toString(),
//       });
//     }
//     var response = await APIHelper.api(
//         APIRoutes.api_post_validate_order, products, APIHelperMethod.POST,
//         header: APIRoutes.x_user_header);

//     if (response != null && response["status"] == 200) {
//       return response["valid_cart"];
//     } else {
//       // AppToast.showToast(message: response['error_message'], isError: true);
//       return true;
//     }
//   }

//   Future<dynamic> checkPendingOrderPayment() async {
//     var header = APIRoutes.x_user_header;
//     header.addAll({"Cookie": 'PHPSESSID=${AppSingleTone().cartSessionId}'});
//     var response = await APIHelper.api(
//         APIRoutes.api_get_check_unpaid_order, {}, APIHelperMethod.GET,
//         header: header);

//     if (response != null && response["status"] == 200) {
//       if (response["unpaid_orders"] > 0) {
//         return true;
//       }
//     }
//     return false;
//   }

//   Future<dynamic> checkOtherVendorroductExists() async {
//     var header = APIRoutes.x_user_header;
//     header.addAll({"Cookie": 'PHPSESSID=${AppSingleTone().cartSessionId}'});
//     var response = await APIHelper.api(
//         APIRoutes.api_get_check_other_vendor_product, {}, APIHelperMethod.GET,
//         header: header);

//     log('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvendor $response');

//     if (response != null && response["status"] == 200) {
//       return response["modal_open"];
//     }
//     return messageTost('Vendor not found');
//     // ;
//   }

//   Future<bool> aggreeVendorProduct(bool status) async {
//     var query = "?accept_terms=$status";
//     var response = await APIHelper.api(
//         "${APIRoutes.api_get_aggree_vendor_product}$query",
//         {},
//         APIHelperMethod.POST,
//         header: APIRoutes.x_user_header);

//     if (response != null && response["status"] == 200) {
//       return response["vendor_terms"];
//     }
//     return false;
//   }

//   Future<bool> removeVendorProduct() async {
//     var response = await APIHelper.api(
//         APIRoutes.api_get_remove_vendor_product, {}, APIHelperMethod.GET,
//         header: APIRoutes.x_user_header);

//     print(response);

//     if (response != null && response["status"] == 200) {
//       return response["products_removed"];
//     }
//     return false;
//   }

//   clear() {
//     DBHelper.cleanDatabase(Constants.cartTableName);
//     this.list.clear();

//     ///CLaar the cart from the API side
//     addToCartApi();
//     AppSingleTone().removeCartNotes();
//     eventBus.fire("updateCart");
//     cartTotalCalculate();
//   }
// }
