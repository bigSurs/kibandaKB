import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/my_orders_cubit/my_orders_cubit.dart';
import 'package:kibanda_kb/models/order/order.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';

import 'package:star_menu/star_menu.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Orders',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: BlocConsumer<MyOrdersCubit, MyOrdersState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                failed: (error) {
                  AppToast.showToast(message: error, isError: true);
                });
          },
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => const Center(
                      child: SpinKitFadingCircle(
                        color: Palette.greenColor,
                      ),
                    ),
                success: (orders) {
                  return orders.length >= 1
                      ? CustomScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          slivers: [
                            CupertinoSliverRefreshControl(
                              refreshTriggerPullDistance: 200,
                              onRefresh: () {
                                return context
                                    .read<MyOrdersCubit>()
                                    .getMyOrders();
                              },
                            ),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                              return SingleOrderWidget(order: orders[index]);
                            }, childCount: orders.length)),
                          ],
                        )
                      : Center(
                          child: Text("You don't have any orders"),
                        );
                },
                orElse: () {
                  return Container();
                });
          },
        ),
      ),
    );
  }
}

class SingleOrderWidget extends StatelessWidget {
  final Order order;
  const SingleOrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        // padding: EdgeInsets.all(8),
        color: Palette.greyColor,
        elevation: 0,
        // decoration: BoxDecoration(
        //     color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Palette.greyColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: TextStyle(
                                color: Palette.placeholderGrey, fontSize: 12),
                          ),
                          Text(
                            order.order_id!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status',
                          style: TextStyle(
                              color: Palette.placeholderGrey, fontSize: 12),
                        ),
                        Text(
                          order.status!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date of Order',
                          style: TextStyle(
                              color: Palette.placeholderGrey, fontSize: 12),
                        ),
                        Text(
                          order.date_added!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Total',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 12),
                      ),
                      Text(
                        order.total!,
                        style: TextStyle(
                            color: Palette.orangeColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                          child: Text('View'),
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 36),
                          color: Palette.orangeColor,
                          onPressed: () {
                            AutoRouter.of(context)
                                .push(SingleOrderRoute(order: order));
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
