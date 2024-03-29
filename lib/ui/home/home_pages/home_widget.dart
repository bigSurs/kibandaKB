// import 'package:auto_route/auto_route.dart';
// import 'package:badges/badges.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
// import 'package:get_it/get_it.dart';
// import 'package:kibanda_kb/authentication/customer_cookie_cubit.dart';
// import 'package:kibanda_kb/authentication/customer_token.dart';
// import 'package:kibanda_kb/configuration/configuration.dart';
// import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
// import 'package:kibanda_kb/cubits/cubit/authentication/token_cubit.dart';
// import 'package:kibanda_kb/cubits/featured_products_cubit/featured_product_cubit.dart';
// import 'package:kibanda_kb/cubits/kibandalist/kibandalist_cubit.dart';
// import 'package:kibanda_kb/models/customer_token_model.dart';
// import 'package:kibanda_kb/models/kibanda_model/kibanda.dart';
// import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
// import 'package:kibanda_kb/routes/router.gr.dart';
// import 'package:kibanda_kb/services/services.dart';
// import 'package:kibanda_kb/ui/home/main_home_page.dart';
// import 'package:kibanda_kb/ui/home/product/product_tile.dart';
// import 'package:quantity_input/quantity_input.dart';

// class HomeWidget extends StatelessWidget {
//   const HomeWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: SizedBox(
//           height: 10,
//           child: CupertinoButton(
//               onPressed: () {
//                 showCupertinoModalPopup(
//                     context: context,
//                     builder: (context) => Center(
//                             child: SizedBox(
//                           // height: 100/,
//                           width: 300,
//                           child: Card(
//                             elevation: 0,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 const CircleAvatar(
//                                   radius: 58,
//                                   backgroundColor: Palette.orangeColor,
//                                   child: CircleAvatar(
//                                     radius: 54,
//                                     backgroundColor: Colors.white,
//                                     child: CircleAvatar(
//                                       radius: 50,
//                                       backgroundImage: NetworkImage(
//                                           'https://th.bing.com/th/id/R.a5758d6fb64904904ec75fd1f083e3fb?rik=QVwaYy2Fd7Xi%2fA&pid=ImgRaw&r=0'),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 const Text('Stalluri'),
//                                 const Text('stalluri@gmail.com'),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 ListTile(
//                                   onTap: () {},
//                                   leading: const Icon(Icons.history),
//                                   title: const Text('Order history'),
//                                   trailing: const Icon(CupertinoIcons.forward),
//                                   subtitle: const Text('View order history'),
//                                 ),
//                                 ListTile(
//                                   onTap: () {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //       builder: (context) =>
//                                     //           SettingsPage()),
//                                     // );
//                                   },
//                                   leading: const Icon(CupertinoIcons.settings),
//                                   title: const Text('About'),
//                                   trailing: const Icon(CupertinoIcons.forward),
//                                   subtitle: const Text(
//                                       'More about this appplication'),
//                                 ),
//                                 ListTile(
//                                   onTap: () {
//                                     // Clear the token
//                                     context.read<TokenCubit>().clear();
//                                     AutoRouter.of(context)
//                                         .replace(SplashScreen());
//                                   },
//                                   leading: const Icon(
//                                     Icons.logout_outlined,
//                                     color: Palette.greenColor,
//                                   ),
//                                   title: const Text(
//                                     'Logout',
//                                     style: TextStyle(color: Colors.red),
//                                   ),
//                                   trailing: const Icon(
//                                     CupertinoIcons.forward,
//                                     color: Palette.greenColor,
//                                   ),
//                                   subtitle: const Text(
//                                     'Logout of this application',
//                                   ),
//                                 ),
//                                 ListTile(
//                                   onTap: () {
//                                     showAboutDialog(
//                                       context: context,
//                                       applicationIcon: Image.asset(
//                                           'assets/logo.png',
//                                           height: 30),
//                                     );
//                                   },
//                                   leading: const Icon(
//                                     CupertinoIcons.info,
//                                     color: Palette.greenColor,
//                                   ),
//                                   title: const Text(
//                                     "T & C(s)",
//                                     style: TextStyle(color: Palette.greenColor),
//                                   ),
//                                   trailing: const Icon(
//                                     CupertinoIcons.forward,
//                                     color: Palette.greenColor,
//                                   ),
//                                   subtitle: const Text(
//                                     'Licenses and terms',
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 )
//                               ],
//                             ),
//                           ),
//                         )));
//               },
//               child: const Center(
//                   child: Icon(
//                 Icons.dehaze,
//                 size: 40,
//                 color: Palette.orangeColor,
//               ))),
//         ),
//         bottomOpacity: 0.9,
//         automaticallyImplyLeading: false,
//         title: const Text(
//           'Product list',
//           style: TextStyle(
//             fontFamily: 'Red Hat Display-BoldItalic',
//             fontStyle: FontStyle.italic,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             // color: Palette.orangeColor,
//           ),
//         ),
//         actions: [
//           CupertinoButton(
//             onPressed: () {
//               AutoRouter.of(context).push(const CartRoute());
//             },
//             child: Badge(
//               badgeContent: Text(
//                 '${context.watch<CartCubit>().state.length}',
//                 style: const TextStyle(color: Colors.white),
//               ),
//               child: const Icon(
//                 Icons.shopping_cart,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 color: Palette.orangeBackgroundColor,
//                 borderRadius: BorderRadius.circular(10)),
//             child: IntrinsicHeight(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Row(
//                   //   children: const [
//                   //     Text(
//                   //       'Pick your Kibanda here ',
//                   //       style: TextStyle(
//                   //         fontFamily: 'Red Hat Display-BoldItalic',
//                   //         fontStyle: FontStyle.italic,
//                   //       ),
//                   //     ),
//                   //     Icon(
//                   //       Boxicons.bx_arrow_from_left,
//                   //       size: 14,
//                   //     ),
//                   //   ],
//                   // ),
//                   Flexible(
//                       child: BlocBuilder<KibandalistCubit, KibandalistState>(
//                     builder: (context, state) {
//                       return state.maybeWhen(
//                           loading: () => const Center(
//                                 child: CircularProgressIndicator(),
//                               ),
//                           success: ((kibandaskistores) =>
//                               FormBuilderSearchableDropdown<String>(
//                                 name: '',
//                                 decoration: const InputDecoration(
//                                   labelText: 'Select Kibanda',
//                                 ),
//                                 popupProps: const PopupProps.menu(
//                                     showSearchBox: true,
//                                     title: Text('Search Kibanda')),
//                                 items: kibandaskistores!
//                                     .map(
//                                         (e) => e.firstname! + ' ' + e.lastname!)
//                                     .toList(),
//                                 onChanged: (val) async {
//                                   var selectedKibanda = kibandaskistores!
//                                       .firstWhere((element) =>
//                                           element.firstname! +
//                                               ' ' +
//                                               element.lastname! ==
//                                           val);
//                                   context
//                                       .read<SelectedKibandaCubit>()
//                                       .save(selectedKibanda);
//                                   var response = await ApiService.postCustomer(
//                                       data: {
//                                         'telephone': selectedKibanda.telephone
//                                       },
//                                       path: 'customer/login/loginascustomer');
//                                   var data = response['token'];
//                                   var cookieData = response['cookie'];
//                                   context.read<CustomerTokenCubit>().emit(data);
//                                   // context.read<TokenCubit>().emit(data);
//                                   context
//                                       .read<CustomerCookieCubit>()
//                                       .emit(cookieData);
//                                   CustomerCookieCubit cookieCubit =
//                                       BlocProvider.of<CustomerCookieCubit>(
//                                           context);
//                                   GetIt.I.registerSingleton(cookieCubit);
//                                   GetIt.I.registerSingleton<CustomerTokenModel>(
//                                       CustomerTokenModel(
//                                           token: data, cookie: cookieData));

//                                   /// This [val] is the value of the selected item (Customer ID)
//                                   // context
//                                   //     .read<VendorProductsCubit>()
//                                   //     .getVendorProductsByAllCategories(
//                                   //         customerId: selectedKibanda
//                                   //             .customer_id as int);
//                                   context
//                                       .read<FeaturedProductCubit>()
//                                       .getFeaturedProducts(context);
//                                 },
//                               )),
//                           orElse: () {
//                             return Container();
//                           });
//                     },
//                   )),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
//               builder: (context, state) {
//                 return state.maybeWhen(loading: () {
//                   return const Center(
//                     child:
//                         CupertinoActivityIndicator(color: Palette.greenColor),
//                   );
//                 }, success: (productList) {
//                   return ListView.builder(
//                     itemCount: productList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ProductTile(product: productList[index]);
//                     },

//                     // children: productList
//                     //     .map((e) => CardWidget(vendorProducts: e))
//                     //     .toList(),
//                   );
//                 }, orElse: () {
//                   return Container();
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CardWidget extends StatefulWidget {
//   final VendorProducts vendorProducts;
//   const CardWidget({Key? key, required this.vendorProducts}) : super(key: key);

//   @override
//   State<CardWidget> createState() => _CardWidgetState();
// }

// class _CardWidgetState extends State<CardWidget> {
//   //TODO:
//   //uncomment these two to use Json data
//   final _image1 =
//       'https://www.kindacode.com/wp-content/uploads/2021/08/face.png';
//   int simpleIntInput = 0;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Flexible(
//       child: FittedBox(
//           child: Container(
//         margin: const EdgeInsets.all(30.0),
//         decoration: BoxDecoration(
//             // color: Palette.orangeBackgroundColor,
//             borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(10.0),
//                 bottomLeft: Radius.circular(10.0),
//                 bottomRight: Radius.circular(10.0),
//                 topLeft: Radius.circular(10.0)),
//             border: Border.all(width: 1, color: Palette.greenColor)),
//         constraints: const BoxConstraints(
//           maxHeight: double.infinity,
//         ),
//         child: Container(
//           // height: height / 6,
//           width: width,
//           height: 250,
//           padding: const EdgeInsets.all(8),
//           child: Flexible(
//             child: Row(
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: [
//                       Expanded(
//                         child: CircleAvatar(
//                           child: CachedNetworkImage(
//                             width: double.infinity,
//                             height: 200,
//                             fit: BoxFit.scaleDown,
//                             imageUrl: widget.vendorProducts.image!,
//                             // progressIndicatorBuilder:
//                             //     (context, url, downloadProgress) =>
//                             //         CircularProgressIndicator(
//                             //             value: downloadProgress.progress),
//                             // errorWidget: (context, url, error) => const Icon(
//                             //   Icons.error,
//                             //   size: 100,
//                             //   color: Colors.red,
//                             // ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(children: [
//                     Row(
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       // mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         const Text(
//                           "Product Name",
//                           style: TextStyle(
//                             fontFamily: 'Red Hat Display',
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Palette.orangeColor,
//                           ),
//                         ),
//                         SizedBox(width: width * 0.01),
//                         Text(
//                           widget.vendorProducts.name!,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Palette.placeholderGrey,
//                             // color: Colors.orange,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: height * 0.02),
//                     Row(children: [
//                       const Text(
//                         "Product Id",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: 'Red Hat Display',
//                           fontWeight: FontWeight.bold,
//                           color: Palette.orangeColor,
//                         ),
//                       ),
//                       SizedBox(width: width * 0.01),
//                       Text(
//                         widget.vendorProducts.product_id.toString(),
//                         // orderde.delivery_timeslot!,
//                         // CalendarTime(DateTime.parse(order.delivery_timeslot!))
//                         //     .toHuman,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Palette.placeholderGrey,
//                         ),
//                       ),
//                     ]),
//                   ]),
//                   const SizedBox(width: 30),
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             'Unit',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Palette.orangeColor,
//                               fontFamily: 'Red Hat Display',
//                             ),
//                           ),
//                           SizedBox(width: width * 0.01),
//                           Text(
//                             // order.delivery_date!,
//                             // CalendarTime(DateTime.parse(
//                             //         orderde.delivery_date!))
//                             //     .toHuman,
//                             widget.vendorProducts.unit!,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Palette.placeholderGrey,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: height * 0.02),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Weight',
//                             style: TextStyle(
//                                 fontFamily: 'Red Hat Display',
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Palette.orangeColor),
//                           ),
//                           SizedBox(width: width * 0.01),
//                           Text(
//                             widget.vendorProducts.weight!,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Palette.placeholderGrey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               const Text(
//                                 'Qty',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               QuantityInput(
//                                   value: simpleIntInput,
//                                   onChanged: (value) => setState(() =>
//                                       simpleIntInput = int.parse(
//                                           value.replaceAll(',', '')))),
//                             ],
//                           ),
//                           Align(
//                             alignment: Alignment.bottomRight,
//                             child: CupertinoButton.filled(
//                               // style: ElevatedButton.styleFrom(
//                               //   // primary: Colors.black,
//                               //   minimumSize: const Size.fromHeight(50), // NEW
//                               // ),
//                               onPressed: () {
//                                 // AutoRouter.of(context)
//                                 //     .push(DirectionsToAddress(
//                                 //   orderId: orderde.order_id!,
//                                 // ));
//                               },
//                               child: const Text(
//                                 'Add to Cart',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ]),
//           ),
//         ),
//       )),
//     );
//   }
// }

// class SelectedKibandaCubit extends Cubit<Kibanda?> {
//   SelectedKibandaCubit() : super(null);
//   save(Kibanda? kibanda) {
//     emit(kibanda);
//   }
// }
