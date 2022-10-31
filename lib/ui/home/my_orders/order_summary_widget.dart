import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/models/order/order.dart';

import '../../../../models/order/order_detail.dart';

class OrderSummaryWidget extends StatelessWidget {
  final Order order;
  final OrderDetail orderDetail;
  const OrderSummaryWidget(
      {Key? key, required this.order, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List appOrderStatus = order.all_app_order_status!.reversed.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Order Id: ${order.order_id}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: Text(
            'Order Status: ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            orderDetail.order_status!,
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Palette.greenColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Delivery Date',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      orderDetail.delivery_date_formatted!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Palette.greenColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Delivery Slot',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      orderDetail.delivery_timeslot!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.placeholderGrey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Cart Amount',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 12),
                      ),
                      Text(
                        'KES ${orderDetail.total}',
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 67, 67),
                            fontSize: 14,
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
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.placeholderGrey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mode of Payment',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 12),
                      ),
                      Text(
                        orderDetail.payment_method!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Billing',
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Total Product Rate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'KES ${orderDetail.total}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'VAT',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'KES ${orderDetail.store_details!['tax']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Delivery Charges',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'KES 0.00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Grand Total',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'KES ${orderDetail.total}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Delivery Address',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            orderDetail.store_details!['address'],
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoButton(
                  child: Text('Prompt Payment'),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 36),
                  color: Palette.greenColor,
                  onPressed: () {
                    // context.read<ReorderCubit>().addOrderToCart(
                    //     productMap: List.generate(
                    //         orderDetail.products!.length,
                    //         (index) => {
                    //               'name': orderDetail.products![index]['name'],
                    //               'amount': orderDetail.products![index]
                    //                   ['quantity'],
                    //             }),
                    //     context: context);
                  }),
            ))
          ],
        ),
      ],
    );
  }
}

class Step extends StatelessWidget {
  final bool complete;
  final bool first;
  final String label;
  const Step(
      {Key? key,
      required this.complete,
      required this.label,
      required this.first})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(children: [
          first
              ? Container()
              : Container(
                  width: 25,
                  height: 2,
                  color: Palette.placeholderGrey,
                ),
          SizedBox(
            height: 10,
          )
        ]),
        Column(
          children: [
            Icon(
              CupertinoIcons.check_mark_circled,
              size: 25,
              color: complete ? Palette.greenColor : Palette.placeholderGrey,
            ),
            Text(label)
          ],
        )
      ],
    );
  }
}
