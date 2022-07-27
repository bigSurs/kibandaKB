import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:quantity_input/quantity_input.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.9,
        automaticallyImplyLeading: false,
        title: const Text('Product list'),
        actions: [Icon(Icons.shopping_cart_checkout_rounded)],
      ),
      body: Column(
        children: [
          Stack(
            // Row()
            children: [
              CardWidget(),
            ],
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int simpleIntInput = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FittedBox(
        child: Container(
      margin: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          // color: Palette.orangeBackgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0)),
          border: Border.all(width: 1, color: Palette.greenColor)),
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: height / 6,
            width: width,
            height: 300,
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Order Id",
                                style: TextStyle(
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.orangeColor,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              const Text(
                                '12',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.placeholderGrey,
                                  // color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Kibanda",
                                style: TextStyle(
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.orangeColor),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                '1123',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.placeholderGrey,
                                ),
                              ),
                            ],
                          ),
                        ]),
                    const SizedBox(width: 30),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Produt Name',
                              style: TextStyle(
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.orangeColor),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              '12',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.placeholderGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Date of Delivery',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Palette.orangeColor,
                                fontFamily: 'Red Hat Display',
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              // order.delivery_date!,
                              // CalendarTime(DateTime.parse(
                              //         orderde.delivery_date!))
                              //     .toHuman,
                              '12/12/12',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.placeholderGrey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(children: [
                          const Text(
                            "Time of Delivery",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.bold,
                              color: Palette.orangeColor,
                            ),
                          ),
                          SizedBox(width: width * 0.01),
                          Text(
                            '12:30 PM',
                            // orderde.delivery_timeslot!,
                            // CalendarTime(DateTime.parse(order.delivery_timeslot!))
                            //     .toHuman,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.placeholderGrey,
                            ),
                          ),
                        ]),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Qty',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                QuantityInput(
                                    value: simpleIntInput,
                                    onChanged: (value) => setState(() =>
                                        simpleIntInput = int.parse(
                                            value.replaceAll(',', '')))),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CupertinoButton.filled(
                                // style: ElevatedButton.styleFrom(
                                //   // primary: Colors.black,
                                //   minimumSize: const Size.fromHeight(50), // NEW
                                // ),
                                onPressed: () {
                                  // AutoRouter.of(context)
                                  //     .push(DirectionsToAddress(
                                  //   orderId: orderde.order_id!,
                                  // ));
                                },
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
