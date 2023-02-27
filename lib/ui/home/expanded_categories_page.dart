import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/featured_product_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/categories_tab_index_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/customer_id_cubit.dart';
import 'package:kibanda_kb/cubits/product_category_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/ui/home/categories/category_products_widget.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';
import 'package:badges/badges.dart' as badges;

class ExpandedCategoriesPage extends StatelessWidget {
  const ExpandedCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Image.asset(
              'assets/images/vegetables_image.png',
              fit: BoxFit.cover,
            ),
            bottom: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text("The Shelf",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
              actions: [
                CupertinoButton(
                    child: Icon(CupertinoIcons.search, color: Colors.black),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      // AutoRouter.of(context).push(SearchRoute(searchQuery: ''));
                    }),
                CupertinoButton(
                    // ignore: sort_child_properties_last
                    child: badges.Badge(
                      badgeContent: Text(
                        context.watch<CartCubit>().state.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      // badgeColor: Palette.greenColor,
                      child: const Icon(
                        CupertinoIcons.cart,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      AutoRouter.of(context).push(CartRoute());
                    }),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BlocConsumer<ProductCategoryCubit, ProductCategoryState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    failed: (e) {
                      AppToast.showToast(message: e, isError: true);
                    });
              },
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () {
                      return Center(
                        child: SpinKitSpinningLines(
                          color: Palette.greenColor,
                        ),
                      );
                    },
                    success: (categories) {
                      var pageController = PageController();
                      var scrollController = ScrollController();
                      return DefaultTabController(
                        length: categories.length,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    controller: scrollController,
                                    physics: BouncingScrollPhysics(),

                                    // onTap: (index) {
                                    //   context
                                    //       .read<CategoryProductsCubit>()
                                    //       .getCategoryProducts(
                                    //           categoryId: int.parse(
                                    //               categories[index]
                                    //                   .category_id!));
                                    // },
                                    children: List.generate(
                                        categories.length,
                                        (index) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          CategoriesTabIndexCubit>()
                                                      .change(index);
                                                  pageController.animateToPage(
                                                      index,
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.bounceIn);
                                                },
                                                child: Container(
                                                  height: 20,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: context
                                                                  .watch<
                                                                      CategoriesTabIndexCubit>()
                                                                  .state ==
                                                              index
                                                          ? Palette
                                                              .limeGreenColor
                                                          : Palette
                                                              .orangeColor),
                                                  child: Center(
                                                    child: Text(
                                                        categories[index].name!,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: context
                                                                        .watch<
                                                                            CategoriesTabIndexCubit>()
                                                                        .state ==
                                                                    index
                                                                ? Palette
                                                                    .placeholderGrey
                                                                : Colors
                                                                    .white)),
                                                  ),
                                                ),
                                              ),
                                            ))),
                              ),
                              Expanded(
                                child: PageView(
                                    physics: BouncingScrollPhysics(),
                                    controller: pageController,
                                    onPageChanged: (val) {
                                      context
                                          .read<CategoriesTabIndexCubit>()
                                          .change(val);
                                      context
                                          .read<FeaturedProductCubit>()
                                          .getFeaturedProducts(
                                              customerId: context
                                                  .read<CustomerIdCubit>()
                                                  .state,
                                              page: 1,
                                              categoryId: int.parse(
                                                  categories[val]
                                                      .category_id!));
                                    },
                                    children: List.generate(
                                        categories.length,
                                        (index) => BlocConsumer<
                                                FeaturedProductCubit,
                                                FeaturedProductState>(
                                              listener: (context, state) {
                                                state.maybeWhen(
                                                    orElse: () {},
                                                    failed: (e) {
                                                      AppToast.showToast(
                                                          message: e,
                                                          isError: true);
                                                    });
                                              },
                                              builder: (context, state) {
                                                return state.maybeWhen(loading:
                                                    () {
                                                  return Center(
                                                    child: SpinKitSpinningLines(
                                                      color: Palette.greenColor,
                                                    ),
                                                  );
                                                }, success:
                                                    (products, page, isLast) {
                                                  return CategoryProductsWidget(
                                                    products: products,
                                                  );
                                                }, orElse: () {
                                                  return Container();
                                                });
                                              },
                                            ))),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    orElse: () => Container());
              },
            ),
          )
        ],
      ),
    );
  }
}
