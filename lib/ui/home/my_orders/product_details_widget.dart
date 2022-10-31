import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/models/order/order.dart';
import 'package:kibanda_kb/models/order/order_detail.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';

class ProductDetailsWidget extends StatelessWidget {
  final Order order;
  final OrderDetail orderDetail;
  const ProductDetailsWidget(
      {Key? key, required this.order, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
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
                            color: Palette.placeholderGrey, fontSize: 12),
                      ),
                      Text(
                        '${order.total}',
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
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return OrderProductWidget(
                  isReturn: true,
                  order: order,
                  product: orderDetail.products![index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: orderDetail.products!.length),
        ))
      ],
    );
  }
}

class OrderProductWidget extends StatelessWidget {
  final bool isReturn;
  final Order order;
  final Map<String, dynamic> product;
  const OrderProductWidget(
      {Key? key,
      required this.isReturn,
      required this.product,
      required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: '${RestClient().imageURL}${product['image']}',
                    height: 100,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('${product['name']}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  Row(
                    children: [
                      Text('Purchase unit ',
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Text('${product['price']}',
                          style: TextStyle(
                              fontSize: 12, color: Palette.orangeColor)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Total :',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      Text('KES ${product['total']}')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Unit Price: ',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      Text('KES ${product['special']}',
                          style: TextStyle(
                              fontSize: 12, color: Palette.orangeColor)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Quantity: ',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      Text(
                          '${int.parse(double.parse(product['quantity']).toStringAsFixed(0))}',
                          style: TextStyle(
                              fontSize: 12, color: Palette.orangeColor)),
                      SizedBox(
                        width: 10,
                      ),
                      // isReturn
                      //     ? OutlinedButton(
                      //         onPressed: () {
                      //           AutoRouter.of(context)
                      //               .push(ReturnProductRoute(order: order));
                      //         },
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text('Return'),
                      //         ))
                      //     : Container()
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
