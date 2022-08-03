import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';

class ProductWidget extends StatefulWidget {
  final VendorProducts product;
  final bool isDialog;
  const ProductWidget({
    Key? key,
    required this.product,
    required this.isDialog,
  }) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final bool inCart = context.watch<CartCubit>().state.any((pr) {
      return pr.product_id == widget.product.product_id!;
    });
    var selectedVariation = widget.product.variations![0];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(widget.product.name!,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                Expanded(child: Container()),
                inCart
                    ? CupertinoButton(
                        child:
                            Icon(CupertinoIcons.doc, color: Palette.greenColor),
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          var noteController = TextEditingController();
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
                                                      color: Palette.greenColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(8),
                                                              topRight: Radius
                                                                  .circular(
                                                                      8))),
                                                  child: Center(
                                                    child: Text(
                                                      'Product Notes',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: FormBuilderTextField(
                                                name: 'note',
                                                maxLines: 4,
                                                controller: noteController,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'You may use this space to notify the product seller about your requirements.',
                                                    labelStyle: TextStyle(
                                                        color: Palette
                                                            .placeholderGrey,
                                                        fontSize: 15),
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: CupertinoButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: CupertinoButton(
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  CartProductMetadataCubit>()
                                                              .setNotes(
                                                                  product: widget
                                                                      .product,
                                                                  notes:
                                                                      noteController
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
                                                              fontSize: 15,
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
                        })
                    : Container()
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoPopupSurface(
                                isSurfacePainted: true,
                                child: CachedNetworkImage(
                                  imageUrl: widget.product.image!,
                                  // height: 100,
                                ),
                              ));
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.product.image!,
                      height: 100,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      inCart ? Container() : Container()
                      //
                      // : SizedBox(
                      //     height: 36,
                      //     width: 160,
                      //     child: DropdownButtonFormField<String>(
                      //         value: selectedVariation['variation_id']
                      //             .toString(),
                      //         onChanged: (val) {
                      //           setState(() {
                      //             selectedVariation = widget
                      //                 .product.variations!
                      //                 .where((element) =>
                      //                     element['variation_id'] == val)
                      //                 .first;
                      //           });

                      //           context.read<CartCubit>().updateCart();

                      //           print(val);
                      //         },
                      //         decoration: InputDecoration(
                      //             border: OutlineInputBorder(),
                      //             contentPadding:
                      //                 EdgeInsets.only(left: 12, right: 12)),
                      //         items: List.generate(
                      //             widget.product.variations!.length,
                      //             (index) => DropdownMenuItem(
                      //                 onTap: () {
                      //                   context
                      //                       .read<SelectedVariationCubit>()
                      //                       .state
                      //                       .addEntries({
                      //                         widget.product
                      //                             .product_id!: widget
                      //                                 .product
                      //                                 .variations![index]
                      //                             ['variation_id']
                      //                       }.entries);
                      //                 },
                      //                 value:
                      //                     widget.product.variations![index]
                      //                             ['variation_id'] ??
                      //                         selectedVariation,
                      //                 child: Text('Per ' +
                      //                     widget.product.variations![index]
                      //                         ['unit'])))),
                      //   ),
                      ,
                      SizedBox(
                        height: 12,
                      ),
                      inCart
                          ? Text.rich(TextSpan(
                              text:
                                  '${widget.product.left_symbol_currency} ${(context.watch<CartProductMetadataCubit>().state.where((element) => element.product_id == widget.product.product_id!).first.variation['special'])} ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                              children: [
                                  TextSpan(
                                      text:
                                          'per ${(context.watch<CartProductMetadataCubit>().state.where((element) => element.product_id == widget.product.product_id!).first.variation['unit'])}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400))
                                ]))
                          : Text.rich(TextSpan(
                              text: widget.product.left_symbol_currency!,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                              children: [
                                  TextSpan(
                                      text: context
                                              .watch<SelectedVariationCubit>()
                                              .state
                                              .entries
                                              .where((element) =>
                                                  element.key ==
                                                  widget.product.product_id!)
                                              .isNotEmpty
                                          ? widget.product.variations!
                                              .where((element) =>
                                                  element['variation_id'] ==
                                                  context
                                                      .watch<
                                                          SelectedVariationCubit>()
                                                      .state
                                                      .entries
                                                      .where((element) =>
                                                          element.key ==
                                                          widget.product
                                                              .product_id!)
                                                      .first
                                                      .value)
                                              .first['special']
                                          : selectedVariation['special'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: context
                                                    .watch<
                                                        SelectedVariationCubit>()
                                                    .state
                                                    .entries
                                                    .where((element) =>
                                                        element.key ==
                                                        widget.product
                                                            .product_id!)
                                                    .isNotEmpty
                                                ? ' per ' +
                                                    widget.product.variations!
                                                        .where((element) =>
                                                            element[
                                                                'variation_id'] ==
                                                            context
                                                                .watch<
                                                                    SelectedVariationCubit>()
                                                                .state
                                                                .entries
                                                                .where((element) =>
                                                                    element
                                                                        .key ==
                                                                    widget
                                                                        .product
                                                                        .product_id!)
                                                                .first
                                                                .value)
                                                        .first['unit']
                                                : ' per ${selectedVariation['unit']}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                ])),
                      inCart
                          ? Container()
                          // ? SizedBox(
                          //     height: 36,
                          //     width: 140,
                          //     child: DropdownButtonFormField<String>(
                          //         onChanged: (val) {
                          //           context
                          //               .read<CartProductMetadataCubit>()
                          //               .setVariation(
                          //                   product: widget.product,
                          //                   vary: widget.product.variations!
                          //                       .where((element) =>
                          //                           element['variation_id'] ==
                          //                           val)
                          //                       .first);
                          //           setState(() {});
                          //           context.read<CartCubit>().updateCart();

                          //           print(val);
                          //         },
                          //         value: context
                          //             .read<CartProductMetadataCubit>()
                          //             .state
                          //             .where((element) =>
                          //                 element.product_id ==
                          //                 widget.product.product_id!)
                          //             .first
                          //             .product_store_id
                          //             .toString(),
                          //         decoration: InputDecoration(
                          //             border: OutlineInputBorder(),
                          //             contentPadding:
                          //                 EdgeInsets.only(left: 12, right: 12)),
                          //         items: List.generate(
                          //             widget.product.variations!.length,
                          //             (index) => DropdownMenuItem(
                          //                 value:
                          //                     widget.product.variations![index]
                          //                         ['variation_id'],
                          //                 child: Text(
                          //                     'Per ' +
                          //                         widget.product
                          //                                 .variations![index]
                          //                             ['unit'],
                          //                     style: TextStyle(
                          //                       fontSize: 14,
                          //                     ))))),
                          //   )
                          : Container(),
                      SizedBox(
                        height: 12,
                      ),
                      inCart
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CupertinoButton(
                                    padding: EdgeInsets.all(0),
                                    child: CircleAvatar(
                                      child: Icon(Icons.remove,
                                          color: Colors.white),
                                      backgroundColor: Palette.orangeColor,
                                    ),
                                    onPressed: () {
                                      if (context
                                              .read<CartProductMetadataCubit>()
                                              .state
                                              .where((element) =>
                                                  element.product_id ==
                                                  widget.product.product_id!)
                                              .first
                                              .amount ==
                                          1) {
                                        context
                                            .read<CartCubit>()
                                            .removeFromCart(
                                                product: widget.product);
                                        var cartState =
                                            context.read<CartCubit>().state;
                                        context
                                            .read<CartCubit>()
                                            .emit(cartState);

                                        setState(() {});
                                      } else {
                                        context
                                            .read<CartProductMetadataCubit>()
                                            .removeProductQuantity(
                                                product: widget.product);

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
                                                widget.product.product_id!)
                                            .first
                                            .amount
                                            .toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )),
                                CupertinoButton(
                                    padding: EdgeInsets.all(0),
                                    child: CircleAvatar(
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
                                      setState(() {});
                                      context.read<CartCubit>().updateCart();
                                    }),
                              ],
                            )
                          : CupertinoButton(
                              onPressed: () {
                                context.read<CartCubit>().addToCart(
                                    product: widget.product,
                                    variation: widget.product.variations![0]);
                                if (widget.isDialog) {
                                  Navigator.pop(context);
                                }
                              },
                              padding: EdgeInsetsDirectional.all(0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Palette.orangeColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 32,
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  )),
                            ),
                      SizedBox(
                        height: 16,
                      )
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

class SelectedVariationCubit extends Cubit<Map<int, dynamic>> {
  SelectedVariationCubit() : super({});
}
