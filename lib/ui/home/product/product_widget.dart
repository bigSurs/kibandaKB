import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:collection/collection.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:badges/badges.dart' as badges;

class ProductWidget extends StatefulWidget {
  final VendorProducts product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    bool inCart = context.watch<CartCubit>().state.any((pr) {
      return pr.product_id == widget.product.product_id!;
    });
    var selectedVariation = widget.product.variations![0];
    return SizedBox(
      width: 300,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(160, 163, 194, 1)),
            borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // inCart
                    //     ? Padding(
                    //         padding: const EdgeInsets.all(4.0),
                    //         child: Icon(
                    //           CupertinoIcons.cart,
                    //           color: Colors.red,
                    //         ),
                    //       )
                    //     : Container(),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(const CartRoute());
                        },
                        child: badges.Badge(
                          badgeContent: Text(
                            '${context.watch<CartCubit>().state.length}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: const Tooltip(
                            message: 'Proceed to checkout',
                            child: Icon(
                              Icons.shopping_cart,
                              color: Palette.orangeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CachedNetworkImage(
                imageUrl: widget.product.thumb!,
                height: 100,
              ),
              inCart
                  ? Container()
                  //
                  : SizedBox(
                      height: 36,
                      // width: 140,
                      child: Column(
                        children: [
                          Flexible(
                            child: DropdownButtonFormField<int>(
                                onChanged: (val) {
                                  setState(() {
                                    selectedVariation = widget
                                        .product.variations!
                                        .firstWhere((element) =>
                                            element['variation_id'] == val);
                                  });

                                  context.read<CartCubit>().updateCart();

                                  print(val);
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.only(left: 12, right: 12)),
                                value: int.parse(
                                    selectedVariation['variation_id']),
                                items: List.generate(
                                    widget.product.variations!.length,
                                    (index) => DropdownMenuItem(
                                        onTap: () {},
                                        value: int.parse(
                                            widget.product.variations![index]
                                                ['variation_id']),
                                        child: Text('Per ' +
                                            widget.product.variations![index]
                                                ['unit'])))),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 12,
              ),
              inCart
                  ? Text.rich(TextSpan(
                      text:
                          '${widget.product.left_symbol_currency} ${(context.watch<CartProductMetadataCubit>().state.firstWhereOrNull((element) => element.product_id == int.parse(widget.product.product_id!))!.variation['special'])} ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      children: [
                          TextSpan(
                              text:
                                  'per ${(context.watch<CartProductMetadataCubit>().state.where((element) => element.product_id == int.parse(widget.product.product_id!)).first.variation['unit'])}',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400))
                        ]))
                  : Text.rich(TextSpan(
                      text: selectedVariation['special'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      children: [
                          TextSpan(
                              text: ' per ${selectedVariation['unit']}',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400))
                        ])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.product.name!,
                    // blankSpace: 20,
                    // numberOfRounds: 1,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 5,
              ),
              inCart
                  ? Row(
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
                                          int.parse(widget.product.product_id!))
                                      .first
                                      .amount ==
                                  1) {
                                context
                                    .read<CartCubit>()
                                    .removeFromCart(product: widget.product);
                                var cartState = context.read<CartCubit>().state;
                                context.read<CartCubit>().emit(cartState);

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
                                        int.parse(widget.product.product_id!))
                                    .first
                                    .amount
                                    .toString(),
                                style: TextStyle(fontSize: 18),
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
                                  .addProductQuantity(product: widget.product);
                              setState(() {});
                              context.read<CartCubit>().updateCart();
                            }),
                      ],
                    )
                  : CupertinoButton(
                      onPressed: () {
                        context.read<CartCubit>().addToCart(
                            product: widget.product,
                            variation: selectedVariation);
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
                                  fontSize: 16),
                            ),
                          )),
                    ),
              SizedBox(
                height: 5,
              ),
              inCart
                  ? SizedBox(
                      height: 36,
                      // width: 140,
                      child: DropdownButtonFormField<int>(
                          onChanged: (val) {
                            context
                                .read<CartProductMetadataCubit>()
                                .setVariation(
                                    product: widget.product,
                                    vary: widget.product.variations!
                                        .where((element) =>
                                            element['variation_id'] == val)
                                        .first);
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
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.only(left: 12, right: 12)),
                          items: List.generate(
                              widget.product.variations!.length,
                              (index) => DropdownMenuItem(
                                  value: int.parse(widget.product.variations![index]
                                      ['variation_id']),
                                  child: Text('Per ' +
                                      widget.product.variations![index]['unit'])))),
                    )
                  : Container(),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
