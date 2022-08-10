import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/select_date_timeslot/select_date_cubit.dart';
import 'package:kibanda_kb/cubits/select_date_timeslot/select_timeslot_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          AutoRouter.of(context).replace(MainHomeRoute());
          // context.read<HomeBottomIndexCubit>().change(0);
          return true;
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Order Placed',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Congratulations, you have successfully placed the order.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Icon(
                  CupertinoIcons.check_mark_circled,
                  color: CupertinoColors.activeGreen,
                  size: 200,
                ),
                SizedBox(
                  height: 32,
                ),
                Text.rich(TextSpan(
                    text: 'Expect your delivery on  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: context.read<SelectDeliveryDateCubit>().state,
                        style: TextStyle(color: Palette.orangeColor),
                      )
                    ])),
                Text.rich(TextSpan(
                    text: '',
                    style: TextStyle(fontSize: 12),
                    children: [
                      // TextSpan(
                      //   text: '3987 ',
                      //   style: TextStyle(color: Palette.orangeColor),
                      // ),
                      TextSpan(
                        text: 'by ',
                      ),
                      TextSpan(
                        text: context.read<SelectTimeslotCubit>().state,
                        style: TextStyle(color: Palette.orangeColor),
                      ),
                    ])),
                CupertinoButton(
                  onPressed: () {
                    // AutoRouter.of(context).push(MyOrdersRoute());
                  },
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 46,
                          child: Center(
                            child: Text(
                              'Manage your order',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Palette.orangeColor,
                              border: Border.all(color: Palette.orangeColor)),
                        ),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                    child: Text(
                      'Take me home',
                      style: TextStyle(
                        color: Palette.placeholderGrey,
                      ),
                    ),
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    })
              ],
            ),
          ),
        ));
  }
}
