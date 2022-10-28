import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kibanda_kb/configuration/configuration.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 4,
            ),
            Text(
              'Hi',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          CupertinoButton(
              child: Icon(Icons.logout),
              onPressed: () {
                HapticFeedback.heavyImpact();
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                            color:
                                                CupertinoColors.destructiveRed,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8))),
                                        child: Center(
                                          child: Text(
                                            'Logout?',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Are you sure to logout of Kwikbasket?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CupertinoButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Dismiss',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                      Expanded(
                                          child: CupertinoButton(
                                              onPressed: () async {
                                                // await context
                                                //     .read<TokenCubit>()
                                                //     .clear();
                                                // await context
                                                //     .read<SessionCubit>()
                                                //     .clear();
                                                // AutoRouter.of(context)
                                                //     .replace(SplashRoute());
                                              },
                                              padding: const EdgeInsets.all(0),
                                              child: Text(
                                                'Yes, logout',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: CupertinoColors
                                                        .destructiveRed),
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
              })
        ],
      ),
    );
  }
}
