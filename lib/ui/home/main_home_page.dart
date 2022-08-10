import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/kibandalist/kibandalist_cubit.dart';
import 'package:kibanda_kb/cubits/vendor_products/vendor_products_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/ui/home/product/product_tile.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

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
              AutoRouter.of(context).push(CartRoute());
            },
            child: Badge(
              badgeContent: Text(
                '${context.watch<CartCubit>().state.length}',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(Icons.shopping_cart),
            ),
          ),
          SizedBox(
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
                          success: ((kibandaskistores) => FormBuilderDropdown(
                                decoration: const InputDecoration(
                                    labelText: 'select a kibanda'),
                                name: 'name',
                                items: kibandaskistores!
                                    .map((e) => DropdownMenuItem(
                                        value: e.customer_id,
                                        child: Text(
                                          e.firstname! + " " + e.lastname!,
                                          style: TextStyle(),
                                        )))
                                    .toList(),
                                onChanged: (val) {
                                  /// This [val] is the value of the selected item (Customer ID)
                                  context
                                      .read<VendorProductsCubit>()
                                      .getVendorProductsByAllCategories(
                                          customerId: val as int);
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
            child: BlocBuilder<VendorProductsCubit, VendorProductsState>(
              builder: (context, state) {
                return state.maybeWhen(loading: () {
                  return const Center(
                    child:
                        CupertinoActivityIndicator(color: Palette.greenColor),
                  );
                }, success: (productList) {
                  return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(product: productList[index]);
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
                            widget.vendorProducts.weight!,
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
