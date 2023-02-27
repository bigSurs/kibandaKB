// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:kwikbasket_customer/cubits/address/address_cubit.dart';
// import 'package:kwikbasket_customer/cubits/address/delivery_address_selection_cubit.dart';
// import 'package:kwikbasket_customer/cubits/cart/cart_cubit.dart';
// import 'package:kwikbasket_customer/models/address/address.dart';
// import 'package:kwikbasket_customer/routes/router.gr.dart';
// import 'package:kwikbasket_customer/utilities/toast/toast.dart';
// import 'package:star_menu/star_menu.dart';
// import 'package:kwikbasket_customer/configuration/configuration.dart';

// class MyAddressesPage extends StatelessWidget {
//   const MyAddressesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text(
//           'My Addresses',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               'Saved Addresses',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Expanded(
//               child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: BlocConsumer<AddressCubit, AddressState>(
//               listener: (context, state) {
//                 state.maybeWhen(
//                     orElse: () {},
//                     success: (v) {
//                       ScaffoldMessenger.of(context).showMaterialBanner(
//                           MaterialBanner(
//                               content: Text('Hello'),
//                               actions: [Text('Dismiss')]));
//                     },
//                     failed: (e) {
//                       AppToast.showToast(message: e, isError: true);
//                     });
//               },
//               builder: (context, state) {
//                 return state.maybeWhen(loading: () {
//                   return Center(
//                     child: SpinKitSpinningLines(color: Palette.greenColor),
//                   );
//                 }, success: (addresses) {
//                   return ListView.separated(
//                       physics: BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return SingleAddressWidget(
//                             isHome: true, address: addresses[index]);
//                       },
//                       separatorBuilder: (context, index) {
//                         return SizedBox(
//                           height: 16,
//                         );
//                       },
//                       itemCount: addresses.length);
//                 }, orElse: () {
//                   return Container();
//                 });
//               },
//             ),
//           )),
//           Card(
//             color: Palette.greyColor,
//             elevation: 0,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     'Would you like to add a new\n address?',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 50),
//                   child: CupertinoButton(
//                     onPressed: () {
//                       AutoRouter.of(context).push(ChooseLocationRoute());
//                     },
//                     padding: EdgeInsets.all(0),
//                     child: Container(
//                       height: 40,
//                       child: Center(
//                         child: Text(
//                           'Add Address',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Palette.orangeColor, fontSize: 16),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),

//                           // color: Palette.orangeColor,
//                           border:
//                               Border.all(color: Palette.orangeColor, width: 2)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: 54,
//         color: Palette.greyColor,
//         child: Row(
//           children: [
//             SizedBox(
//               width: 20,
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${context.watch<CartCubit>().state.length} items',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 Text(
//                   "KES " +
//                       (context.watch<CartCubit>().getBalance() +
//                               context.watch<CartCubit>().getTax())
//                           .toString(),
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: 100,
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: 30,
//                 child: CupertinoButton(
//                   color: Palette.orangeColor,
//                   onPressed: () {
//                     if (context.read<DeliveryAddressSelectionCubit>().state !=
//                         null) {
//                       AutoRouter.of(context).push(DeliveryDetailsRoute());
//                     } else {
//                       AppToast.showToast(
//                           message:
//                               'Select your delivery address or add a new one',
//                           isError: true);
//                     }
//                   },
//                   padding: EdgeInsets.all(0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Schedule Delivery',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       Icon(
//                         CupertinoIcons.chevron_forward,
//                         color: Colors.white,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 40,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SingleAddressWidget extends StatelessWidget {
//   final bool isHome;
//   final Address address;
//   const SingleAddressWidget(
//       {Key? key, required this.isHome, required this.address})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.read<DeliveryAddressSelectionCubit>().save(address);
//       },
//       child: Container(
//         height: 110,
//         decoration: BoxDecoration(
//             border: Border.all(
//                 color: context.watch<DeliveryAddressSelectionCubit>().state ==
//                         address
//                     ? Palette.greenColor
//                     : Palette.placeholderGrey,
//                 width: context.watch<DeliveryAddressSelectionCubit>().state ==
//                         address
//                     ? 3
//                     : 1),
//             borderRadius: BorderRadius.circular(4)),
//         padding: EdgeInsets.all(4),
//         child: Row(
//           children: [
//             Column(
//               children: [
//                 Icon(
//                   CupertinoIcons.building_2_fill,
//                   color: Palette.orangeColor,
//                 )
//               ],
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Palette.orangeColor)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         address.address_type!,
//                         style: TextStyle(
//                             color: Palette.orangeColor,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Text('${address.address}, ${address.city}'),
//                   SizedBox(
//                     height: 12,
//                   )
//                 ],
//               ),
//             ),
//             Column(
//               children: [
//                 StarMenu(
//                  params:
//                     StarMenuParameters(onItemTapped: (index, controller) async {
//                   controller.closeMenu();
//                 }),
//                   child: Icon(Icons.more_vert),
//                   items: [
//                     Container(
//                       width: 200,
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           CupertinoButton(
//                               onPressed: () {},
//                               color: Palette.greenColor,
//                               padding: EdgeInsets.all(0),
//                               child: Text('Edit Address')),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           CupertinoButton(
//                               onPressed: () {},
//                               color: CupertinoColors.destructiveRed,
//                               padding: EdgeInsets.all(0),
//                               child: Text('Delete Address')),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
