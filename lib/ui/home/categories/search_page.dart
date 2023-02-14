import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/products_cubit/products_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/products_cubit/recently_searched_products_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/ui/home/product/expanded_product_widget.dart';
import 'package:kibanda_kb/utilities/utilities.dart';


class SearchPage extends StatelessWidget {
  final String? searchQuery;
  const SearchPage({Key? key, this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductsCubit>().searchProducts(search: searchQuery!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Palette.greyColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Center(
            child: FormBuilderTextField(
                name: 'search_parameter',
                controller: TextEditingController(text: searchQuery ?? ''),
                onTap: () {},
                onSubmitted: (val) {
                  FocusScope.of(context).unfocus();
                  context.read<ProductsCubit>().searchProducts(search: val!);
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    fillColor: Palette.greyColor,
                    contentPadding: EdgeInsets.symmetric(vertical: 3),
                    hintText: 'Search products',
                    hintStyle: TextStyle(color: Palette.placeholderGrey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Palette.placeholderGrey,
                    ),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Recently searched ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Expanded(child: SizedBox()),
                CupertinoButton(
                    padding: EdgeInsets.all(0),
                    child: Text('Clear'),
                    onPressed: () {
                      context.read<RecentlySearchedProductsCubit>().emit([]);
                      HapticFeedback.lightImpact();
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
                height: 23,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RecentlySearchedItemWidget(
                          label: context
                              .watch<RecentlySearchedProductsCubit>()
                              .state[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 12,
                      );
                    },
                    itemCount: context
                        .watch<RecentlySearchedProductsCubit>()
                        .state
                        .length)),
          ),
          SizedBox(
            height: 24,
            child: Opacity(
              opacity: 0.2,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocConsumer<ProductsCubit, ProductsState>(
                listener: (context, state) {
                  state.maybeWhen(
                      success: (products, search) {
                        context
                            .read<RecentlySearchedProductsCubit>()
                            .state
                            .add(search);
                      },
                      orElse: () {},
                      failed: (e) {
                        AppToast.showToast(message: e, isError: true);
                      });
                },
                builder: (context, state) {
                  return state.maybeWhen(success: (products, search) {
                    return products.length >= 1
                        ? ListView(
                            physics: BouncingScrollPhysics(),
                            children: List.generate(
                                products.length,
                                (index) => SearchProductTile(
                                      product: products[index],
                                    )),
                          )
                        : Center(
                            child: Text('No results found'),
                          );
                  }, loading: () {
                    return Center(
                      child: SpinKitSpinningLines(
                        color: Palette.greenColor,
                      ),
                    );
                  }, orElse: () {
                    return Container();
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchProductTile extends StatelessWidget {
  final VendorProducts product;
  const SearchProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool inCart = context
        .watch<CartCubit>()
        .state
        .any((element) => element.product_id == product.product_id);
    if (product.category_name != null &&
        product.thumb != null &&
        product.name != null) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        onTap: () async {
          HapticFeedback.selectionClick();
          await showCupertinoModalPopup(
              context: context,
              builder: (context) => Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpandedCategoriesProductWidget(
                            product: product,
                            isDialog: true,
                          ),
                        ),
                      ),
                    ),
                  ));
        },
        leading: SizedBox(
          width: 100,
          height: 100,
          child: GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoPopupSurface(
                      isSurfacePainted: false,
                      child: CachedNetworkImage(
                        imageUrl: product.thumb!,
                        fit: BoxFit.fill,
                      ),
                    );
                  });
            },
            child: CachedNetworkImage(
              imageUrl: product.thumb!,
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                product.name!,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            inCart
                ? Icon(
                    CupertinoIcons.cart,
                    color: Palette.orangeColor,
                  )
                : Container()
          ],
        ),
        subtitle: Text(
          product.category_name!,
          style: TextStyle(fontSize: 12),
        ),
      );
    } else {
      return Container();
    }
  }
}

class RecentlySearchedItemWidget extends StatelessWidget {
  final String label;
  const RecentlySearchedItemWidget({Key? key, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        context.read<ProductsCubit>().searchProducts(search: label);
      },
      child: Container(
        height: 22,
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Palette.placeholderGrey)),
        child: Text(label,
            style: TextStyle(
                fontSize: 14,
                color: Palette.placeholderGrey,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
