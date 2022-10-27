import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';

import 'package:star_menu/star_menu.dart';

class CartProductList extends StatelessWidget {
  final Function refreshCartUI;
  const CartProductList({Key? key, required this.refreshCartUI})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.separated(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            VendorProducts product = context.watch<CartCubit>().state[index];

            return CartProductWidget(
                refresh: refreshCartUI, index: index, product: product);
          },
          itemCount: context.watch<CartCubit>().state.length),
    );
  }
}

class CartProductWidget extends StatefulWidget {
  final VendorProducts product;
  final int index;
  final Function refresh;
  const CartProductWidget(
      {Key? key,
      required this.product,
      required this.refresh,
      required this.index})
      : super(key: key);

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // padding: const EdgeInsets.all(4),
      margin: EdgeInsets.all(0),
      child: SizedBox(
        height: 185,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Container()),
                StarMenu(
                  // params: StarMenuParameters(
                  //     onItemTapped: (index, controller) async {
                  //   controller.closeMenu();
                  // }),
                  child: Icon(Icons.more_vert),
                  items: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CupertinoButton(
                              onPressed: () {
                                var noteController = TextEditingController(
                                    text: context
                                        .read<CartProductMetadataCubit>()
                                        .state
                                        .where((element) =>
                                            element.product_id ==
                                            context
                                                .read<CartCubit>()
                                                .state[widget.index]
                                                .product_id!)
                                        .first
                                        .product_note
                                        .toString());
                                showDialog(
                                    context: context,
                                    builder: (context) => Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            color: Palette
                                                                .greenColor,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8))),
                                                        child: Center(
                                                          child: Text(
                                                            'Product Notes',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: StatefulBuilder(
                                                        builder: (context,
                                                            statefulMethod) {
                                                      return FormBuilderTextField(
                                                        name: 'note',
                                                        maxLines: 4,
                                                        controller:
                                                            noteController,
                                                        decoration: InputDecoration(
                                                            labelText:
                                                                'You may use this space to notify the product seller about your requirements.',
                                                            labelStyle: TextStyle(
                                                                color: Palette
                                                                    .placeholderGrey,
                                                                fontSize: 15),
                                                            border: InputBorder
                                                                .none),
                                                      );
                                                    }),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:
                                                              CupertinoButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )),
                                                      Expanded(
                                                          child:
                                                              CupertinoButton(
                                                                  onPressed:
                                                                      () {
                                                                    context.read<CartProductMetadataCubit>().setNotes(
                                                                        product:
                                                                            widget
                                                                                .product,
                                                                        notes: noteController
                                                                            .text);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(0),
                                                                  child: Text(
                                                                    'Submit',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Palette
                                                                            .greenColor),
                                                                  ))),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                              },
                              color: Palette.greenColor,
                              padding: EdgeInsets.all(0),
                              child: Text('Add notes',
                                  style: TextStyle(fontSize: 13))),
                          SizedBox(
                            height: 4,
                          ),
                          CupertinoButton(
                              child: Text(
                                'Remove',
                                style: TextStyle(fontSize: 13),
                              ),
                              color: Colors.red,
                              onPressed: () {
                                HapticFeedback.heavyImpact();

                                showDialog(
                                    context: context,
                                    builder: (context) => Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            color: CupertinoColors
                                                                .destructiveRed,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8))),
                                                        child: Center(
                                                          child: Text(
                                                            'Delete the item?',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Are you sure to delete this item from the cart?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Palette
                                                              .placeholderGrey,
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child:
                                                              CupertinoButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        child: Text(
                                                          'No, keep it',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )),
                                                      Expanded(
                                                          child:
                                                              CupertinoButton(
                                                                  onPressed:
                                                                      () {
                                                                    context
                                                                        .read<
                                                                            CartCubit>()
                                                                        .removeFromCart(
                                                                            product:
                                                                                widget.product);
                                                                    var cartState = context
                                                                        .read<
                                                                            CartCubit>()
                                                                        .state;
                                                                    context
                                                                        .read<
                                                                            CartCubit>()
                                                                        .emit(
                                                                            cartState);
                                                                    widget
                                                                        .refresh();
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(0),
                                                                  child: Text(
                                                                    'Yes, delete',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
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
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: widget.product.thumb!,
                    height: 150,
                  ),
                ),
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.name!,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),

                      ///From Here
                      Text.rich(TextSpan(
                          text:
                              '${widget.product.left_symbol_currency} ${(context.watch<CartProductMetadataCubit>().state.where((element) => element.product_id == int.parse(widget.product.product_id!)).first.variation['special'])} ',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                                text:
                                    'per ${(context.watch<CartProductMetadataCubit>().state.where((element) => element.product_id == int.parse(widget.product.product_id!)).first.variation['unit'])}',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400))
                          ])),
                      SizedBox(
                        height: 45,
                        // width: 140,
                        child: Column(
                          children: [
                            Flexible(
                              child: DropdownButtonFormField<int>(
                                  isExpanded: true,
                                  onChanged: (val) {
                                    context
                                        .read<CartProductMetadataCubit>()
                                        .setVariation(
                                            product: widget.product,
                                            vary: widget.product.variations!
                                                .where((element) =>
                                                    element['variation_id'] ==
                                                    val)
                                                .first);
                                    widget.refresh();
                                    setState(() {});
                                    context.read<CartCubit>().updateCart();

                                    print(val);
                                  },
                                  value: int.parse(context
                                      .read<CartProductMetadataCubit>()
                                      .state
                                      .where((element) =>
                                          element.product_id ==
                                          int.parse(widget.product.product_id!))
                                      .first
                                      .variation['variation_id']),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 12, right: 12)),
                                  items: List.generate(
                                      widget.product.variations!.length,
                                      (index) => DropdownMenuItem(
                                          value: int.parse(
                                              widget.product.variations![index]
                                                  ['variation_id']),
                                          child: Text(
                                              'Per ' + widget.product.variations![index]['unit']))),
                                  style: TextStyle(fontSize: 14, color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoButton(
                              padding: EdgeInsets.all(0),
                              child: CircleAvatar(
                                radius: 16,
                                child: Icon(Icons.remove, color: Colors.white),
                                backgroundColor: Palette.orangeColor,
                              ),
                              onPressed: () {
                                if (context
                                        .read<CartProductMetadataCubit>()
                                        .state
                                        .where((element) =>
                                            element.product_id ==
                                            int.parse(
                                                widget.product.product_id!))
                                        .first
                                        .amount ==
                                    1) {
                                  context
                                      .read<CartCubit>()
                                      .removeFromCart(product: widget.product);
                                  var cartState =
                                      context.read<CartCubit>().state;
                                  context.read<CartCubit>().emit(cartState);
                                  widget.refresh();
                                  setState(() {});
                                } else {
                                  context
                                      .read<CartProductMetadataCubit>()
                                      .removeProductQuantity(
                                          product: widget.product);
                                  widget.refresh();

                                  setState(() {});
                                  context.read<CartCubit>().updateCart();
                                }
                              }),
                          SizedBox(
                              width: 60,
                              child: Center(
                                child: Text(
                                  context
                                      .watch<CartProductMetadataCubit>()
                                      .state
                                      .where((element) =>
                                          element.product_id ==
                                          int.parse(widget.product.product_id!))
                                      .first
                                      .amount
                                      .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              )),
                          CupertinoButton(
                              padding: EdgeInsets.all(0),
                              child: CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                backgroundColor: Palette.orangeColor,
                              ),
                              onPressed: () {
                                context
                                    .read<CartProductMetadataCubit>()
                                    .addProductQuantity(
                                        product: widget.product);
                                widget.refresh();
                                setState(() {});
                                context.read<CartCubit>().updateCart();
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
