// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/session_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/token_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/category_products_refresh_cubit/category_products_refresh_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/featured_product_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/home_bottom_index_cubit.dart';
import 'package:kibanda_kb/cubits/kibandalist/kibandalist_cubit.dart';
import 'package:kibanda_kb/cubits/vendor_products/vendor_products_cubit.dart';
import 'package:kibanda_kb/models/customer_token_model.dart';
import 'package:kibanda_kb/models/kibanda_model/kibanda.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';
import 'package:kibanda_kb/ui/home/cart/cart_page.dart';
import 'package:kibanda_kb/ui/home/home_pages/basket_widget.dart';
import 'package:kibanda_kb/ui/home/home_pages/home_widget.dart';
import 'package:kibanda_kb/ui/home/home_pages/more_widget.dart';
import 'package:kibanda_kb/ui/home/product/product_tile.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import '../../authentication/customer_cookie_cubit.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final _image1 =
      'https://www.kindacode.com/wp-content/uploads/2021/08/face.png';
  // int _value = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeWidget(),
      // BasketWidget(),
      CartPage(),
      MoreWidget()
    ];
    return Scaffold(
      body: pages[context.watch<HomeBottomIndexCubit>().state],
      // Column(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.all(8),
      //       decoration: BoxDecoration(
      //           color: Palette.orangeBackgroundColor,
      //           borderRadius: BorderRadius.circular(10)),
      //       child: IntrinsicHeight(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             // Row(
      //             //   children: const [
      //             //     Text(
      //             //       'Pick your Kibanda here ',
      //             //       style: TextStyle(
      //             //         fontFamily: 'Red Hat Display-BoldItalic',
      //             //         fontStyle: FontStyle.italic,
      //             //       ),
      //             //     ),
      //             //     Icon(
      //             //       Boxicons.bx_arrow_from_left,
      //             //       size: 14,
      //             //     ),
      //             //   ],
      //             // ),
      //             Flexible(
      //                 child: BlocBuilder<KibandalistCubit, KibandalistState>(
      //               builder: (context, state) {
      //                 return state.maybeWhen(
      //                     loading: () => const Center(
      //                           child: CircularProgressIndicator(),
      //                         ),
      //                     success: ((kibandaskistores) =>
      //                         FormBuilderSearchableDropdown<String>(
      //                           // dropdownDecoratorProps:
      //                           //     const DropDownDecoratorProps(
      //                           //   dropdownSearchDecoration: InputDecoration(
      //                           //     disabledBorder: InputBorder.none,
      //                           //     hintText: 'Select a Kibanda',
      //                           //     hintStyle: TextStyle(
      //                           //       color: Colors.black,
      //                           //       fontSize: 12,
      //                           //     ),
      //                           //   ),
      //                           // ),

      //                           name: '',
      //                           decoration: const InputDecoration(
      //                             labelText: 'Select Kibanda',
      //                           ),
      //                           popupProps: const PopupProps.menu(
      //                               showSearchBox: true,
      //                               title: Text('Search Kibanda')),
      //                           items: kibandaskistores!
      //                               .map(
      //                                   (e) => e.firstname! + ' ' + e.lastname!)
      //                               .toList(),
      //                           onChanged: (val) async {
      //                             var selectedKibanda = kibandaskistores!
      //                                 .firstWhere((element) =>
      //                                     element.firstname! +
      //                                         ' ' +
      //                                         element.lastname! ==
      //                                     val);
      //                             context
      //                                 .read<SelectedKibandaCubit>()
      //                                 .save(selectedKibanda);
      //                             var response = await ApiService.postCustomer(
      //                                 data: {
      //                                   'telephone': selectedKibanda.telephone
      //                                 },
      //                                 path: 'customer/login/loginascustomer');
      //                             var data = response['token'];
      //                             var cookieData = response['cookie'];
      //                             context.read<CustomerTokenCubit>().emit(data);
      //                             // context.read<TokenCubit>().emit(data);
      //                             context
      //                                 .read<CustomerCookieCubit>()
      //                                 .emit(cookieData);
      //                             CustomerCookieCubit cookieCubit =
      //                                 BlocProvider.of<CustomerCookieCubit>(
      //                                     context);
      //                             GetIt.I.registerSingleton(cookieCubit);
      //                             GetIt.I.registerSingleton<CustomerTokenModel>(
      //                                 CustomerTokenModel(
      //                                     token: data, cookie: cookieData));

      //                             /// This [val] is the value of the selected item (Customer ID)
      //                             // context
      //                             //     .read<VendorProductsCubit>()
      //                             //     .getVendorProductsByAllCategories(
      //         customerId: selectedKibanda
      //             .customer_id as int);
      //                             context
      //                                 .read<FeaturedProductCubit>()
      //                                 .getFeaturedProducts(context);
      //                           },
      //                         )),
      //                     orElse: () {
      //                       return Container();
      //                     });
      //               },
      //             )),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
      //         builder: (context, state) {
      //           return state.maybeWhen(loading: () {
      //             return const Center(
      //               child:
      //                   CupertinoActivityIndicator(color: Palette.greenColor),
      //             );
      //           }, success: (productList) {
      //             return ListView.builder(
      //               itemCount: productList.length,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return ProductTile(product: productList[index]);
      //               },

      //               // children: productList
      //               //     .map((e) => CardWidget(vendorProducts: e))
      //               //     .toList(),
      //             );
      //           }, orElse: () {
      //             return Container();
      //           });
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(color: Palette.orangeColor),
        selectedItemColor: Palette.orangeColor,
        unselectedItemColor: Palette.placeholderGrey,
        onTap: (val) {
          context.read<HomeBottomIndexCubit>().change(val);
        },
        currentIndex: context.watch<HomeBottomIndexCubit>().state,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: 'Home'),
          // BottomNavigationBarItem(
          //     icon: Icon(CupertinoIcons.bag), label: 'Baskets'),
          BottomNavigationBarItem(
              icon: Badge(
                badgeColor: Palette.greenColor,
                badgeContent: Text(
                  context.watch<CartCubit>().state.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(CupertinoIcons.cart),
              ),
              label: 'My Cart'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'More'),
        ],
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  final VendorProducts vendorProducts;
  const CardWidget({Key? key, required this.vendorProducts}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  //TODO:
  //uncomment these two to use Json data
  final _image1 =
      'https://www.kindacode.com/wp-content/uploads/2021/08/face.png';
  int simpleIntInput = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: FittedBox(
          child: Container(
        margin: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            // color: Palette.orangeBackgroundColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0)),
            border: Border.all(width: 1, color: Palette.greenColor)),
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: Container(
          // height: height / 6,
          width: width,
          height: 250,
          padding: const EdgeInsets.all(8),
          child: Flexible(
            child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.scaleDown,
                            imageUrl: widget.vendorProducts.image!,
                            // progressIndicatorBuilder:
                            //     (context, url, downloadProgress) =>
                            //         CircularProgressIndicator(
                            //             value: downloadProgress.progress),
                            // errorWidget: (context, url, error) => const Icon(
                            //   Icons.error,
                            //   size: 100,
                            //   color: Colors.red,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Product Name",
                          style: TextStyle(
                            fontFamily: 'Red Hat Display',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.orangeColor,
                          ),
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          widget.vendorProducts.name!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Palette.placeholderGrey,
                            // color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(children: [
                      const Text(
                        "Product Id",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.bold,
                          color: Palette.orangeColor,
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        widget.vendorProducts.product_id.toString(),
                        // orderde.delivery_timeslot!,
                        // CalendarTime(DateTime.parse(order.delivery_timeslot!))
                        //     .toHuman,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Palette.placeholderGrey,
                        ),
                      ),
                    ]),
                  ]),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Unit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Palette.orangeColor,
                              fontFamily: 'Red Hat Display',
                            ),
                          ),
                          SizedBox(width: width * 0.01),
                          Text(
                            // order.delivery_date!,
                            // CalendarTime(DateTime.parse(
                            //         orderde.delivery_date!))
                            //     .toHuman,
                            widget.vendorProducts.unit!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.placeholderGrey,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                                fontFamily: 'Red Hat Display',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Palette.orangeColor),
                          ),
                          SizedBox(width: width * 0.01),
                          Text(
                            widget.vendorProducts.unit!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.placeholderGrey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Qty',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              QuantityInput(
                                  value: simpleIntInput,
                                  onChanged: (value) => setState(() =>
                                      simpleIntInput = int.parse(
                                          value.replaceAll(',', '')))),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CupertinoButton.filled(
                              // style: ElevatedButton.styleFrom(
                              //   // primary: Colors.black,
                              //   minimumSize: const Size.fromHeight(50), // NEW
                              // ),
                              onPressed: () {
                                // AutoRouter.of(context)
                                //     .push(DirectionsToAddress(
                                //   orderId: orderde.order_id!,
                                // ));
                              },
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
          ),
        ),
      )),
    );
  }
}

class SelectedKibandaCubit extends Cubit<Kibanda?> {
  SelectedKibandaCubit() : super(null);
  save(Kibanda? kibanda) {
    emit(kibanda);
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.9,
        automaticallyImplyLeading: false,
        title: const Text(
          'Product list',
          style: TextStyle(
            fontFamily: 'Red Hat Display-BoldItalic',
            fontStyle: FontStyle.italic,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // color: Palette.orangeColor,
          ),
        ),
        actions: [
          CupertinoButton(
            onPressed: () {
              AutoRouter.of(context).push(const CartRoute());
            },
            child: Badge(
              badgeContent: Text(
                '${context.watch<CartCubit>().state.length}',
                style: const TextStyle(color: Colors.white),
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Palette.orangeBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   children: const [
                  //     Text(
                  //       'Pick your Kibanda here ',
                  //       style: TextStyle(
                  //         fontFamily: 'Red Hat Display-BoldItalic',
                  //         fontStyle: FontStyle.italic,
                  //       ),
                  //     ),
                  //     Icon(
                  //       Boxicons.bx_arrow_from_left,
                  //       size: 14,
                  //     ),
                  //   ],
                  // ),
                  Flexible(
                      child: BlocBuilder<KibandalistCubit, KibandalistState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                          loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          success: ((kibandaskistores) =>
                              FormBuilderSearchableDropdown<String>(
                                name: '',
                                decoration: const InputDecoration(
                                  labelText: 'Select Kibanda',
                                ),
                                popupProps: const PopupProps.menu(
                                    showSearchBox: true,
                                    title: Text('Search Kibanda')),
                                items: kibandaskistores!
                                    .map(
                                        (e) => e.firstname! + ' ' + e.lastname!)
                                    .toList(),
                                onChanged: (val) async {
                                  var selectedKibanda = kibandaskistores!
                                      .firstWhere((element) =>
                                          element.firstname! +
                                              ' ' +
                                              element.lastname! ==
                                          val);
                                  context
                                      .read<SelectedKibandaCubit>()
                                      .save(selectedKibanda);
                                  var response = await ApiService.postCustomer(
                                      data: {
                                        'telephone': selectedKibanda.telephone
                                      },
                                      path: 'customer/login/loginascustomer');
                                  var data = response['token'];
                                  var customerID = int.parse(
                                      response['data']['customer_id']);
                                  var cookieData = response['cookie'];
                                  context.read<CustomerTokenCubit>().emit(data);
                                  context
                                      .read<CustomerIdCubit>()
                                      .emit(customerID);
                                  // context.read<TokenCubit>().emit(data);
                                  context
                                      .read<CustomerCookieCubit>()
                                      .emit(cookieData);
                                  CustomerCookieCubit cookieCubit =
                                      BlocProvider.of<CustomerCookieCubit>(
                                          context);
                                  GetIt.I.registerSingleton(cookieCubit);
                                  GetIt.I.registerSingleton<CustomerTokenModel>(
                                      CustomerTokenModel(
                                          token: data, cookie: cookieData));

                                  /// This [val] is the value of the selected item (Customer ID)
                                  // context
                                  //     .read<VendorProductsCubit>()
                                  //     .getVendorProductsByAllCategories(
                                  //         customerId: selectedKibanda
                                  //             .customer_id as int);
                                  context
                                      .read<FeaturedProductCubit>()
                                      .getFeaturedProducts(
                                        page: 1,
                                        customerId: customerID,
                                      );
                                },
                              )),
                          orElse: () {
                            return Container();
                          });
                    },
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
              builder: (context, state) {
                return state.maybeWhen(loading: () {
                  return const Center(
                    child:
                        CupertinoActivityIndicator(color: Palette.greenColor),
                  );
                }, success: (
                  products,
                  isLast,
                  page,
                ) {
                  loadMore() async {
                    // context.read<CategoryProductsRefreshCubit>().load();

                    var prod = await context
                        .read<FeaturedProductCubit>()
                        .getMore(
                            page: page + 1,
                            customerId: context.read<CustomerIdCubit>().state);
                    context.read<FeaturedProductCubit>().emit(
                        FeaturedProductState.success(
                            page: page + 1,
                            isLast: isLast,
                            products: [...products, ...prod]));
                            context.read<CategoryProductsRefreshCubit>().reset();
                  setState(() {});

                    print(page);
                  }

                  var _scrollController = ScrollController();
                  _scrollController.addListener(() {
                    if (_scrollController.position.pixels ==
                        _scrollController.position.maxScrollExtent) {
                      loadMore();
                    }
                  });
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: products.length,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(product: products[index]);
                    },

                    // children: productList
                    //     .map((e) => CardWidget(vendorProducts: e))
                    //     .toList(),
                  );
                }, orElse: () {
                  return Container();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 4,
            ),
            // Text(
            //   'Hi',
            //   style:
            //       TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            // ),
          ],
        ),
        actions: [
          CupertinoButton(
              child: Icon(Icons.logout),
              onPressed: () {
                HapticFeedback.heavyImpact();
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                            color:
                                                CupertinoColors.destructiveRed,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8))),
                                        child: Center(
                                          child: Text(
                                            'Logout?',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Are you sure to logout of Kwikbasket?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CupertinoButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Dismiss',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                      Expanded(
                                          child: CupertinoButton(
                                              onPressed: () async {
                                                await context
                                                    .read<TokenCubit>()
                                                    .clear();
                                                await context
                                                    .read<SessionCubit>()
                                                    .clear();
                                                AutoRouter.of(context)
                                                    .replace(SplashScreen());
                                              },
                                              padding: const EdgeInsets.all(0),
                                              child: Text(
                                                'Yes, logout',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: CupertinoColors
                                                        .destructiveRed),
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
              })
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text('${context.read<UserInfoCubit>().state.telephone}'),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text('${context.read<UserInfoCubit>().state.email}'),
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            // MoreActions(),
            ListTile(
              onTap: () {
                // AutoRouter.of(context).push(TransactionsRoute());
                AutoRouter.of(context).push(MyOrdersRoute());
              },
              leading: const Icon(
                FontAwesomeIcons.history,
                color: Palette.orangeColor,
              ),
              title: const Text(
                'My Orders',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              subtitle: const Text(
                'View your past Orders',
                style: TextStyle(),
              ),
              trailing: const Icon(
                CupertinoIcons.chevron_right,
                color: Palette.orangeColor,
              ),
            ),
            ListTile(
              onTap: () {
                // AutoRouter.of(context).push(TransactionsRoute());
                //TODO: ADD required params here
                AutoRouter.of(context).push(TransactionRoute(orderData: {}));
              },
              leading: const Icon(
                FontAwesomeIcons.moneyBillWheat,
                color: Palette.orangeColor,
              ),
              title: const Text(
                'Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              subtitle: const Text(
                'Track your order payments',
                style: TextStyle(),
              ),
              trailing: const Icon(
                CupertinoIcons.chevron_right,
                color: Palette.orangeColor,
              ),
            ),

            // ListTile(
            //   onTap: () {
            //     AutoRouter.of(context).push(SettingsRoute());
            //   },
            //   leading: Icon(
            //     Icons.settings,
            //     color: Palette.orangeColor,
            //   ),
            //   title: Text(
            //     'My Settings',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            //   ),
            //   subtitle: Text(
            //     'View and modify your settings',
            //     style: TextStyle(fontSize: 12),
            //   ),
            //   trailing: Icon(CupertinoIcons.chevron_right,
            //       color: Palette.orangeColor),
            // ),
            // ListTile(
            //   onTap: () {
            //     RateMyApp(
            //             preferencesPrefix: 'rateMyApp_',
            //             minDays: 7,
            //             minLaunches: 10,
            //             remindDays: 7,
            //             remindLaunches: 10,
            //             googlePlayIdentifier: 'fr.skyost.example',
            //             appStoreIdentifier: '1491556149')
            //         .showRateDialog(
            //       context,
            //       title: 'Rate this app',
            //       // The dialog title.
            //       message:
            //           'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.', // The dialog message.
            //       rateButton: 'RATE', // The dialog "rate" button text.
            //       noButton: 'NO THANKS', // The dialog "no" button text.
            //       laterButton: 'MAYBE LATER', // The dialog "later" button text.
            //       listener: (button) {
            //         // The button click listener (useful if you want to cancel the click event).
            //         switch (button) {
            //           case RateMyAppDialogButton.rate:
            //             print('Clicked on "Rate".');
            //             break;
            //           case RateMyAppDialogButton.later:
            //             print('Clicked on "Later".');
            //             break;
            //           case RateMyAppDialogButton.no:
            //             print('Clicked on "No".');
            //             break;
            //         }

            //         return true; // Return false if you want to cancel the click event.
            //       },
            //       ignoreNativeDialog: Platform
            //           .isAndroid, // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
            //       dialogStyle: const DialogStyle(), // Custom dialog styles.
            //       onDismissed: () => RateMyApp().callEvent(RateMyAppEventType
            //           .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
            //       // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
            //       // actionsBuilder: (context) => [], // This one allows you to use your own buttons.
            //     );
            //   },
            //   leading: Icon(
            //     CupertinoIcons.star_fill,
            //     color: Palette.greenColor,
            //   ),
            //   title: Text(
            //     'Rate us',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            //   ),
            //   subtitle: Text(
            //     'Your valuable feedback fuels us',
            //     style: TextStyle(fontSize: 12),
            //   ),
            //   trailing: Icon(CupertinoIcons.chevron_right,
            //       color: Palette.orangeColor),
            // ),
            //
            Divider(),
            //   ListTile(
            //     onTap: () async {
            //       await launch(
            //           "https://www.kwikbasket.com/index.php?path=common/home/about_us#:~:text=KwikBasket's%20mission%20is%20to%20bring,Fruits%20%26%20Vegetables%20to%20our%20Customers.");
            //     },
            //     leading: Icon(
            //       CupertinoIcons.info,
            //       color: Palette.placeholderGrey,
            //     ),
            //     title: Text(
            //       'About Us',
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            //     ),
            //     subtitle: Text(
            //       'Know us better, read the T&C and policies',
            //       style: TextStyle(fontSize: 12),
            //     ),
            //     trailing: Icon(CupertinoIcons.chevron_right,
            //         color: Palette.orangeColor),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}

class CustomerIdCubit extends Cubit<int> {
  CustomerIdCubit(int state) : super(state);

  // var token =
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2NjI0NzkxOTQsImp0aSI6Im9qNVZGVHJRTHRIXC96NCtRanFvdG1oazU1T29vS1oyRFJsR01sZFltdU8wPSIsImlzcyI6InNlcnZlck5hbWUiLCJuYmYiOjE2NjI0NzkxOTQsImV4cCI6MTY3ODI1OTE5NCwiZGF0YSI6eyJpZCI6IjY1MiIsIm5hbWUiOiI3NDYwNTE4MzMifX0.6ezMPOyS0I9u2UURah4AvSchEBO0rvs2tR9WDxXlpfLwbi_rqa8OcZdtIZW-xth5eStP3mWSEVJHMZHJJgn-0g';

  saveToken(int customerID) {
    emit(customerID);
  }
}
