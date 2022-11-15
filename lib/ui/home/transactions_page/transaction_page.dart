import 'dart:ui';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kibanda_kb/app/theme/app_theme.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/constants/constants.dart';
import 'package:kibanda_kb/cubits/cubit/payments/payment_method_cubit/selected_payment_method_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/place_order_cubit/place_order_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/ui_cubits/transaction_top_index_cubit.dart';
import 'package:kibanda_kb/cubits/transactions/transaction_cubit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kibanda_kb/models/transactions/transactions.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/ui/home/main_home_page.dart';
// import 'package:kibanda_kb/ui/home/transactions_page/transaction_page_view_model.dart';

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

class TransactionPage extends StatefulWidget {
  final transactionData;
  final Map<String, dynamic> orderData;
  const TransactionPage(
      {Key? key, this.transactionData, required this.orderData})
      : super(key: key);

  @override
  TransactionPageState createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  // TransactionPageViewModel? model;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SuccessfulWidget(),
      PendingWidget(
        orderData: {},
      ),
      CancelledWidget()
    ];
    // print("runtimeType -> " + runtimeType.toString());
    // // ignore: unnecessary_statements
    // model ?? (model = TransactionPageViewModel(this));
    return Stack(
      children: [
        Scaffold(
          // appBar: AppBar(
          //   title: const Text('My Transactions'),
          //   // backButton: () => Navigator.of(context).pop(),
          //   actions: [
          //     // if (this.model!.selectedTab == "Pending Payments")
          //     IconButton(
          //       onPressed: () {},
          //       // onPressed: this.model!.paySelected,
          //       icon: const Icon(Icons.payments),
          //     ),
          //   ],
          // ),
          body: Stack(
            key: UniqueKey(),
            children: [
              pages[context.watch<TransactionIndexCubit>().state],
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: Palette.orangeColor),
            selectedItemColor: Palette.orangeColor,
            unselectedItemColor: Palette.placeholderGrey,
            onTap: (val) {
              context.read<TransactionIndexCubit>().change(val);
            },
            currentIndex: context.watch<TransactionIndexCubit>().state,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.hand_thumbsup,
                  ),
                  label: 'Successful'),
              // BottomNavigationBarItem(
              //     icon: Icon(CupertinoIcons.bag), label: 'Baskets'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.timer_fill), label: 'Pending'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.return_icon), label: 'Cancelled'),
            ],
          ),
        ),
      ],
    );
  }
}

Center noData(String message) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppTheme.colorGrey),
      ),
    ),
  );
}

class PendingWidget extends StatelessWidget {
  final Map<String, dynamic> orderData;
  const PendingWidget({Key? key, required this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Transactions',
          style: TextStyle(
            fontFamily: 'Red Hat Display-Medium ',
            // fontStyle: FontStyle.italic,
            fontSize: 24,
            // fontWeight: FontWeight.bold,
            // color: Palette.orangeColor,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        // backgroundColor: Colors.white,
      ),
      body: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(loading: () {
            return const Center(
              child: CircularProgressIndicator(color: Palette.greenColor),
            );
          }, success: (pendingTransactions, successfulTransactions,
              cancelledTransactions) {
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: pendingTransactions.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: CardTwo(
                          pendingTransactions: pendingTransactions[index],
                          orderReference: '',
                          orderData: orderData,
                        ))),
                  );
                },
              ),
            );
          }, orElse: () {
            return Container();
          });
        },
      ),
    );
  }
}

class SuccessfulWidget extends StatelessWidget {
  const SuccessfulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Successful Transactions',
          style: TextStyle(
            fontFamily: 'Red Hat Display-Medium ',
            // fontStyle: FontStyle.italic,
            fontSize: 24,
            // fontWeight: FontWeight.bold,
            // color: Palette.orangeColor,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        // backgroundColor: Colors.white,
      ),
      body: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(loading: () {
            return const Center(
              child: CircularProgressIndicator(color: Palette.greenColor),
            );
          }, success: (pendingTransactions, successfulTransactions,
              cancelledTransactions) {
            return cancelledTransactions.isEmpty
                ? const Center(
                    child: Text('No Orders have been paid yet'),
                  )
                : AnimationLimiter(
                    child: ListView.builder(
                      itemCount: successfulTransactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: CardOne(
                                successfulTransactions:
                                    successfulTransactions[index],
                              ))),
                        );
                      },
                    ),
                  );
          }, orElse: () {
            return Center(
              child: Text(
                'You do not have any Transactions yet',
                style: TextStyle(color: Palette.orangeColor),
              ),
            );
          });
        },
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  final Transactions successfulTransactions;
  const CardOne({Key? key, required this.successfulTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: ValueKey(data.orderId),
      margin: EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 8),
      color: AppTheme.colorWhite,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            // child: Checkbox(
            //   value: Transaction.isSelected,
            //   onChanged: (val) {
            //     // setState(() {
            //     //   data.isSelected = val;
            //     // });
            //   },
            // ),
          ),
          Constants.widthSizeBox,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Order Id : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: successfulTransactions.orderId,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      // "${data.currencyCode} ${data.total}",
                      'KES 6590',
                      style: const TextStyle(
                        color: AppTheme.colorDarkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Constants.heightSizeBox,
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Order Date : ",
                        style: TextStyle(
                          color: AppTheme.colorDarkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: CalendarTime(DateTime.parse(
                                    successfulTransactions.date_added!))
                                .toHuman,
                            style: TextStyle(
                              color: AppTheme.colorDarkGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Payment Methods : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "Mpesa on Delivery",
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // var amount = numberFunction(getNumPrice(data.total!));
                        // amount = amount.replaceAll(".", "");
                        // var orderIds = [];
                        // orderIds.add(data.orderId);
                        // this.model!.payNowButton(amount, orderIds);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        color: AppTheme.colorPerpal,
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            color: AppTheme.colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  final String orderReference;

  final Map<String, dynamic> orderData;
  final Transactions pendingTransactions;
  const CardTwo({
    Key? key,
    required this.pendingTransactions,
    required this.orderReference,
    required this.orderData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: ValueKey(data.orderId),
      margin: EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 8),
      color: AppTheme.colorWhite,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            // child: Checkbox(
            //   value: Transaction.isSelected,
            //   onChanged: (val) {
            //     // setState(() {
            //     //   data.isSelected = val;
            //     // });
            //   },
            // ),
          ),
          Constants.widthSizeBox,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Order Id : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: pendingTransactions.orderId,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      // "${data.currencyCode} ${data.total}",
                      "${'KES'} ${pendingTransactions.total!}",

                      style: const TextStyle(
                        color: AppTheme.colorDarkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Constants.heightSizeBox,
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Order Date : ",
                        style: TextStyle(
                          color: AppTheme.colorDarkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: CalendarTime(DateTime.parse(
                                    pendingTransactions.date_added!))
                                .toHuman,
                            style: TextStyle(
                              color: AppTheme.colorDarkGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Payment Method : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: pendingTransactions.paymentMethod,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        var data = orderData;
                        var x = generateRandomString(12);
                        data.addAll({
                          "payment_method": 'mpesa on delivery',
                          "dropoff_notes": '',
                          "payment_method_code": context
                              .read<SelectedPaymentMethodCubit>()
                              .state!
                              .code!,
                          "shipping_address_id": context
                              .read<SelectedKibandaCubit>()
                              .state!
                              .address_id!,
                          // "shipping_city_id": context
                          //     .read<DeliveryAddressSelectionCubit>()
                          //     .state!
                          //     .address_id!,
                          // 'login_latitude':
                          //     context.read<UserLocationCubit>().state.latitude,
                          // 'login_longitude':
                          //     context.read<UserLocationCubit>().state.longitude,
                          'login_mode': 'm',
                          "payment_method['code']": context
                              .read<SelectedPaymentMethodCubit>()
                              .state!
                              .code!,
                          "payment_method['sort_order']": context
                                  .read<SelectedPaymentMethodCubit>()
                                  .state!
                                  .sort_order ??
                              '0',
                          "payment_method['terms']": context
                                  .read<SelectedPaymentMethodCubit>()
                                  .state!
                                  .terms ??
                              '',
                          "payment_method['title']": context
                                  .read<SelectedPaymentMethodCubit>()
                                  .state!
                                  .title ??
                              '',
                          'mpesa_refrence_id': x
                        });
                        var phoneData = AutoRouter.of(context).push(
                            MpesaPaymentRoute(orderReference: x, data: data));
                        data.addAll(phoneData as Map<String, dynamic>);
                        context.read<PlaceOrderCubit>().placeOrderMpesa(data);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        color: AppTheme.colorPerpal,
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            color: AppTheme.colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardThree extends StatelessWidget {
  final Transactions cancelledTransactions;
  const CardThree({Key? key, required this.cancelledTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: ValueKey(data.orderId),
      margin: EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 8),
      color: AppTheme.colorWhite,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            // child: Checkbox(
            //   value: Transaction.isSelected,
            //   onChanged: (val) {
            //     // setState(() {
            //     //   data.isSelected = val;
            //     // });
            //   },
            // ),
          ),
          Constants.widthSizeBox,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Order Id : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: cancelledTransactions.orderId,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      // "${data.currencyCode} ${data.total}",
                      'KES 6590',
                      style: const TextStyle(
                        color: AppTheme.colorDarkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Constants.heightSizeBox,
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Order Date : ",
                        style: TextStyle(
                          color: AppTheme.colorDarkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: CalendarTime(DateTime.parse(
                                    cancelledTransactions.date_added!))
                                .toHuman,
                            style: TextStyle(
                              color: AppTheme.colorDarkGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Payment Methods : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "Mpesa on Delivery",
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // var amount = numberFunction(getNumPrice(data.total!));
                        // amount = amount.replaceAll(".", "");
                        // var orderIds = [];
                        // orderIds.add(data.orderId);
                        // this.model!.payNowButton(amount, orderIds);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        color: AppTheme.colorPerpal,
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            color: AppTheme.colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CancelledWidget extends StatelessWidget {
  const CancelledWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cancelled Transactions',
          style: TextStyle(
            fontFamily: 'Red Hat Display-Medium ',
            // fontStyle: FontStyle.italic,
            fontSize: 24,
            // fontWeight: FontWeight.bold,
            // color: Palette.orangeColor,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        // backgroundColor: Colors.white,
      ),
      body: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(loading: () {
            return const Center(
              child: CircularProgressIndicator(color: Palette.greenColor),
            );
          }, success: (pendingTransactions, successfulTransactions,
              cancelledTransactions) {
            return cancelledTransactions.isEmpty
                ? Center(
                    child: Text('No cancelled transactions'),
                  )
                : AnimationLimiter(
                    child: ListView.builder(
                      itemCount: cancelledTransactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: CardThree(
                                cancelledTransactions:
                                    cancelledTransactions[index],
                              ))),
                        );
                      },
                    ),
                  );
          }, orElse: () {
            return Container();
          });
        },
      ),
    );
  }
}
