// import 'package:get_it/get_it.dart';
// import 'package:kwik_basket_customer/cubits/cubits.dart';
// import 'package:kwik_basket_customer/cubits/token_cubit/cookie_cubit.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppSingleTone {
//   static final AppSingleTone _singleton = AppSingleTone._internal();

//   factory AppSingleTone() {
//     return _singleton;
//   }

//   AppSingleTone._internal();

//   String language = "en";
//   String? userToken;
//   // String? firstName;
//   // String? lastName;
//   // String? customerId;
//   String? isDeviceVerify = "false";
//   String? deliveryAddressId;
//   bool? showOnBoarding = true;
//   String? cartSessionId;

//   Future<void> getCartSessionId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     this.cartSessionId = prefs.getString("cartSessionId");
//   }

//   Future<void> setCartSessionId(value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     this.cartSessionId = value;
//     prefs.setString("cartSessionId", value);
//   }

//   Future<void> getDeliveryAddressId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     this.deliveryAddressId = prefs.getString("deliveryAddressId");
//   }

//   Future<void> setDeliveryAddressId(value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     this.deliveryAddressId = value;
//     prefs.setString("deliveryAddressId", value);
//   }

//   Future<void> setShowOnBoarding(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     this.showOnBoarding = value;
//     prefs.setBool("showOnBoarding", value);
//   }

//   Future<void> getShowOnBoarding() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getBool("showOnBoardin4g") != null) {
//       this.showOnBoarding = prefs.getBool("showOnBoarding");
//     } else {
//       this.showOnBoarding = true;
//     }
//   }

//   Future<void> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     TokenCubit tokenCubit = GetIt.I<TokenCubit>();
//     final token = tokenCubit.state;
//     userToken = token;
//     // firstName = prefs.getString('firstname');
//     // lastName = prefs.getString('lastname');
//     // customerId = prefs.getString('customerId');
//     isDeviceVerify = prefs.getString('isDeviceVerify');
//   }

//   void setToken(token, firstname, lastname, customerId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('token', "Bearer $token");
//     prefs.setString('firstname', firstname);
//     prefs.setString('lastname', lastname);
//     prefs.setString('customerId', customerId);
//   }

//   Future<bool> removeToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('firstname');
//     await prefs.remove('lastname');
//     await prefs.remove('customerid');
//     await prefs.remove('cartSessionId');
//     bool result = await prefs.remove('token');
//     if (result) {
//       this.clear();
//     }
//     return result;
//   }

//   Future<void> addCartNotes(String notes) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("cartNotes", notes);
//   }

//   Future<String?> getCartNotes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("cartNotes");
//   }

//   Future<void> removeCartNotes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove("cartNotes");
//   }

//   Future<void> setDeviceVerify(String val) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("isDeviceVerify", val);
//   }

//   void clear() {
//     this.userToken = null;
//     // this.cartSessionId = null;
//   }
// }
