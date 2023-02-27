
import 'package:flutter/material.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/ui/home/product/expanded_product_widget.dart';
import 'package:kibanda_kb/ui/home/product/product_widget.dart';

class FeaturedWidget extends StatelessWidget {
  final List<VendorProducts> products;

  const FeaturedWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProductWidget(
              product: products[index]
            ),
          );
        },
       
      ),
    );
  }
}