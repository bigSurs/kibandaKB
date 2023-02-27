
import 'package:flutter/material.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/models/order/order_detail.dart';

import '../../../../models/order/order.dart';

class ProductNotesWidget extends StatelessWidget {
  final Order order;
  final OrderDetail orderDetail;
  const ProductNotesWidget(
      {Key? key, required this.order, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
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
                        'Order Id',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 12),
                      ),
                      Text(
                        order.order_id!,
                        style: TextStyle(
                            color: Colors.black,
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
                flex: 3,
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
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                      Text(
                        'KES ${order.total}',
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
          height: 20,
        ),
        ...List.generate(
            orderDetail.products!.length,
            (index) => ProductNote(
                note: orderDetail.products![index]['product_note'],
                date: order.date_added!))
      ],
    );
  }
}

class ProductNote extends StatelessWidget {
  final String? note;
  final String date;
  const ProductNote({Key? key, required this.note, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Palette.greyColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Note',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(note ?? ''),
              Text(
                date,
                style: TextStyle(color: Palette.placeholderGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
