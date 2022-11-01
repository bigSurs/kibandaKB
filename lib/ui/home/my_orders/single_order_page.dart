import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:kibanda_kb/models/order/order.dart';
import 'package:kibanda_kb/ui/home/my_orders/order_summary_widget.dart';
import 'package:kibanda_kb/ui/home/my_orders/product_details_widget.dart';

import 'package:star_menu/star_menu.dart';

import 'product_notes_widget.dart';

class SingleOrderPage extends StatelessWidget {
  final Order order;
  const SingleOrderPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<OrderDetailsCubit>().getOrderDetails(order);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Palette.greenColor,
          actions: [
            StarMenu(
              params:
                  StarMenuParameters(onItemTapped: (index, controller) async {
                controller.closeMenu();
              }),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              items: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // CupertinoButton(
                      //     onPressed: () {},
                      //     color: Palette.greenColor,
                      //     padding: EdgeInsets.all(0),
                      //     child: Text('Edit Order')),
                      SizedBox(
                        height: 4,
                      ),
                      CupertinoButton(
                          onPressed: () {},
                          color: CupertinoColors.destructiveRed,
                          padding: EdgeInsets.all(0),
                          child: Text('Cancel Order')),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // CupertinoButton(
                      //     onPressed: () {
                      //       AutoRouter.of(context)
                      //           .push(RepostAnIssueRoute(order: order));
                      //     },
                      //     color: CupertinoColors.activeBlue,
                      //     padding: EdgeInsets.all(0),
                      //     child: Text('Report Issue')),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
          title: Text(
            'Order Details',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          bottom: TabBar(
              physics: BouncingScrollPhysics(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(),
              tabs: [
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    'Order Summary',
                    style: TextStyle(color: Palette.greenColor),
                  )),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Center(
                      child: Text(
                    'Product Details',
                    style: TextStyle(color: Palette.greenColor),
                  )),
                ),
              ]),
        ),
        body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => Container(),
                loading: () => Center(
                      child: SpinKitSpinningLines(color: Palette.greenColor),
                    ),
                success: (orderDetails) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Palette.greenColor,
                        height: 20,
                      ),
                      Expanded(
                          child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                            OrderSummaryWidget(
                                order: order, orderDetail: orderDetails),
                            Column(
                              children: [
                                Expanded(
                                  child: ProductDetailsWidget(
                                      order: order, orderDetail: orderDetails),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: ProductNotesWidget(
                                        order: order,
                                        orderDetail: orderDetails),
                                  ),
                                ),
                              ],
                            ),
                          ]))
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
