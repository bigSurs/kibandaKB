import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/address/delivery_address_selection_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_product_metadata_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/delivery_timeslot/delivery_timeslot_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/place_order_cubit/place_order_cubit.dart';
import 'package:kibanda_kb/cubits/select_date_timeslot/select_date_cubit.dart';
import 'package:kibanda_kb/cubits/select_date_timeslot/select_timeslot_cubit.dart';
import 'package:kibanda_kb/cubits/standard_express_delivery_mode_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/ui/home/main_home_page.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';
import 'package:intl/intl.dart';

class DeliveryDetailsPage extends StatelessWidget {
  
  final Map<String, dynamic> orderData;
  const DeliveryDetailsPage({Key? key, required this.orderData, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DeliveryTimeslotCubit>().getDeliveryTimeslots(
        address_id: context.read<SelectedKibandaCubit>().state!.address_id!);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Delivery Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocConsumer<DeliveryTimeslotCubit, DeliveryTimeslotState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              failed: (e) {
                AppToast.showToast(message: e, isError: true);
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
            return Container();
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(color: Palette.greenColor),
            );
          }, success: (dates, timeslots) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/delivery_details_bg.svg',
                          color: Colors.red,
                        ),
                        SvgPicture.asset('assets/svgs/delivery_details.svg'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Choose delivery schedule',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'You will be able to choose upto 5 days',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Palette.greyColor),
                      ),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return DeliveryDateWidget(
                              index: index,
                              dateTime: dates[index],
                              date: DateTime(
                                int.parse(
                                    dates[index].toString().split('-').last),
                                int.parse(
                                    dates[index].toString().split('-')[1]),
                                int.parse(
                                    dates[index].toString().split('-').first),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 12,
                            );
                          },
                          itemCount: dates.length),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height:
                        context.watch<SelectDeliveryDateCubit>().state != null
                            ? 50
                            : 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Choose your delivery time',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Palette.greyColor),
                      ),
                      height:
                          context.watch<SelectDeliveryDateCubit>().state != null
                              ? 50
                              : 0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: timeslots[context
                                    .watch<SelectDeliveryDateCubit>()
                                    .state ??
                                dates[0]]
                            .length,
                        itemBuilder: (context, index) {
                          if (timeslots[context
                                          .read<SelectDeliveryDateCubit>()
                                          .state ??
                                      dates[0]][index]['timeslot'] ==
                                  '06:00am - 08:00am' ||
                              timeslots[context
                                          .read<SelectDeliveryDateCubit>()
                                          .state ??
                                      dates[0]][index]['timeslot'] ==
                                  '08:00am - 10:00am') {
                            return DeliveryTimeSlotWidget(
                              timeslot: timeslots[context
                                      .read<SelectDeliveryDateCubit>()
                                      .state ??
                                  dates[0]][index],
                              index: index,
                            );
                          } else {
                            return Container();
                          }
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
      bottomNavigationBar: Container(
        height: 54,
        color: Palette.orangeColor,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.watch<CartCubit>().state.length} items',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "KES " +
                      (context.watch<CartCubit>().getBalance() +
                              context.watch<CartCubit>().getTax())
                          .toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: SizedBox(
                height: 30,
                child:
                    //  BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
                    //   listener: (context, state) {
                    //     state.maybeWhen(
                    //         orElse: () {},
                    //         loading: () {
                    //           return const CircularProgressIndicator(
                    //               color: Palette.greenColor);
                    //         },
                    //         success: () {
                    //           AppToast.showToast(
                    //               message: 'Order Placed successfully',
                    //               isError: false);
                    //           // if (context.read<HybridSelectedCubit>().state) {
                    //           //   if (context.read<HybridTypeCubit>().state == 'mpesa') {
                    //           //     AutoRouter.of(context).replace(MpesaPaymentRoute(
                    //           //         orderReference:
                    //           //             orderData['order_reference_number']));
                    //           //   } else {
                    //           //     AutoRouter.of(context).push(OrderSuccessRoute());
                    //           //     context.read<CartCubit>().emit([]);
                    //           //     context.read<CartProductMetadataCubit>().emit([]);
                    //           //   }
                    //           // } else {
                    //           // if (context
                    //           //         .read<SelectedPaymentMethodCubit>()
                    //           //         .state!
                    //           //         .code ==
                    //           //     'mpesa') {
                    //           //   AutoRouter.of(context).replace(MpesaPaymentRoute(
                    //           //       orderReference:
                    //           //           orderData['order_reference_number']));
                    //           // } else {
                    //           // AutoRouter.of(context).push(OrderSuccessRoute());
                    //           AutoRouter.of(context)
                    //               .push(PaymentOPtionsRoute(orderData: {}));
                    //           context.read<CartCubit>().emit([]);
                    //           context.read<CartProductMetadataCubit>().emit([]);
                    //           // }
                    //         },
                    //         failed: (e) {
                    //           AppToast.showToast(message: e, isError: true);
                    //         });
                    //     // TODO: implement listener
                    //   },
                    // builder: (context, state) {
                    // return
                    CupertinoButton(
                  color: Colors.white,
                  onPressed: () {
                    if (context.read<SelectDeliveryDateCubit>().state == null ||
                        context.read<SelectTimeslotCubit>().state == null) {
                      AppToast.showToast(
                          message:
                              'Please select your preferred delivery date and time',
                          isError: true);
                    } else {
                      for (int i = 0;
                          i < context.read<CartCubit>().state.length;
                          i++) {
                        Map<String, dynamic> data = {
                          'payment_method': 'mPesa on Delivery',
                          'payment_method_code': 'mod'
                        };
                        var x = generateRandomString(12);
                        for (int i = 0;
                            i < context.read<CartCubit>().state.length;
                            i++) {
                          data.addAll({
                            'shipping_address_id': context
                                .read<SelectedKibandaCubit>()
                                .state!
                                .address_id!,
                            'products[$i][product_store_id]': context
                                .read<CartProductMetadataCubit>()
                                .state
                                .where((element) =>
                                    element.product_id ==
                                    int.parse(context
                                        .read<CartCubit>()
                                        .state[i]
                                        .product_id!))
                                .first
                                .variation['variation_id'],
                            'products[$i][product_id]':
                                context.read<CartCubit>().state[i].product_id,
                            'products[$i][unit]':
                                context.read<CartCubit>().state[i].unit,
                            'products[$i][model]':
                                context.read<CartCubit>().state[i].model,
                            'products[$i][weight]': '0',
                            'products[$i][store_id]': '75',
                            'products[$i][store_id]': '75',
                            'products[$i][name]':
                                context.read<CartCubit>().state[i].name,
                            'products[$i][store_product_variation_id]': '0',
                            'products[$i][product_type]': 'replaceable',
                            'products[$i][download]': '0',
                            'products[$i][minimum]': 0,
                            'products[$i][subtract]': 0,
                            'products[$i][reward]': 0,
                            'products[$i][product_type]': 'replaceable',
                            'products[$i][store_product_variation_id]': '0',
                            'coupon': 0,
                            'total': context.read<CartCubit>().getBalance(),
                            'sub_total': context.read<CartCubit>().getBalance(),
                            'reward': 0,
                            'products[$i][total]':
                                context.read<CartCubit>().getBalance(),
                            'products[$i][product_note]': context
                                .read<CartProductMetadataCubit>()
                                .state
                                .where((element) =>
                                    element.product_id ==
                                    int.parse(context
                                        .read<CartCubit>()
                                        .state[i]
                                        .product_id!))
                                .first
                                .product_note
                                .toString(),
                            'products[$i][quantity]': context
                                .read<CartProductMetadataCubit>()
                                .state
                                .where((element) =>
                                    element.product_id ==
                                    int.parse(context
                                        .read<CartCubit>()
                                        .state[i]
                                        .product_id!))
                                .first
                                .amount
                                .toString(),
                            'products[$i][price]': context
                                .read<CartCubit>()
                                .state[i]
                                .special
                                .toString(),
                            //Store info
                            'stores[75][store_id]': '75',
                            'stores[75][timeslot]':
                                context.read<SelectTimeslotCubit>().state,
                            'stores[75][timeslot_selected]':
                                context.read<SelectTimeslotCubit>().state,
                            'stores[75][shipping_code]':
                                'store_delivery.store_delivery',
                            'stores[75][shipping_method]': 'Standard Delivery',
                            'stores[75][dates]':
                                context.read<SelectDeliveryDateCubit>().state,
                            'stores[75][comment]': '',
                            'stores[75][delivery_date]':
                                context.read<SelectDeliveryDateCubit>().state,
                            'stores[75][total]':
                                context.read<CartCubit>().getBalance(),
                            'stores[75][sub_total]':
                                context.read<CartCubit>().getBalance(),
                            'stores[75][weight]': '0',
                            'stores[75][order_reference_number]': x,
                            'order_reference_number': x,
                          });
                        }
                        AutoRouter.of(context)
                            .push(PaymentOPtionsRoute(orderData: data,));
                        // context.read<PlaceOrderCubit>().placeOrder(data);
                      }
                    }
                  },
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Payment',
                        style: TextStyle(
                            color: Palette.orangeColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        CupertinoIcons.chevron_forward,
                        color: Palette.orangeColor,
                      )
                    ],
                  ),
                ),
                // },
                // ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

class ModeOfDeliveryWidget extends StatelessWidget {
  final bool active;
  final bool express;
  const ModeOfDeliveryWidget(
      {Key? key, required this.express, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        context.read<StandardExpressDeliveryModeCubit>().toggle(!express);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(4),
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 2,
                color: active ? Palette.greenColor : Palette.placeholderGrey)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            express
                ? SvgPicture.asset('assets/svgs/express_truck.svg')
                : SvgPicture.asset('assets/svgs/standard_truck.svg'),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  express ? 'Express' : 'Standard',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(express ? 'KES 100.00' : 'Free delivery',
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DeliveryDateWidget extends StatelessWidget {
  final int index;
  final String dateTime;
  final DateTime date;
  const DeliveryDateWidget(
      {Key? key,
      required this.index,
      required this.date,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        context.read<SelectDeliveryDateCubit>().change(dateTime);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 2.5,
                color:
                    context.watch<SelectDeliveryDateCubit>().state == dateTime
                        ? Palette.greenColor
                        : Palette.placeholderGrey)),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Center(
                  child: Text(DateFormat('MMM').format(date),
                      style: TextStyle(fontSize: 12, color: Colors.black))),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Palette.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(date.day.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 60,
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Center(
                child: Text(
                  DateFormat('EEE').format(date),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Palette.orangeColor),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryTimeSlotWidget extends StatelessWidget {
  final int index;
  final Map<String, dynamic> timeslot;
  const DeliveryTimeSlotWidget(
      {Key? key, required this.timeslot, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        context.read<SelectTimeslotCubit>().change(timeslot['timeslot']);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child:
            Text(timeslot['timeslot'], style: TextStyle(color: Colors.black)),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 2,
                color: context.watch<SelectTimeslotCubit>().state ==
                        timeslot['timeslot']
                    ? Palette.greenColor
                    : Palette.placeholderGrey)),
      ),
    );
  }
}
