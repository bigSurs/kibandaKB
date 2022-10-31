// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/session_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/token_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            // Text(
            //   'Hi',
            //   style:
            //       TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            // ),
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
                                                await context
                                                    .read<TokenCubit>()
                                                    .clear();
                                                // await context
                                                //     .read<SessionCubit>()
                                                //     .clear();
                                                AutoRouter.of(context)
                                                    .replace(SplashScreen());
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text('${context.read<UserInfoCubit>().state.telephone}'),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text('${context.read<UserInfoCubit>().state.email}'),
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            // MoreActions(),
            ListTile(
              onTap: () {
                // AutoRouter.of(context).push(TransactionsRoute());
                AutoRouter.of(context).push(MyOrdersRoute());
              },
              leading: const Icon(
                FontAwesomeIcons.history,
                color: Palette.orangeColor,
              ),
              title: const Text(
                'My Orders',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              subtitle: const Text(
                'View your past Orders',
                style: TextStyle(),
              ),
              trailing: const Icon(
                CupertinoIcons.chevron_right,
                color: Palette.orangeColor,
              ),
            ),

            // ListTile(
            //   onTap: () {
            //     AutoRouter.of(context).push(SettingsRoute());
            //   },
            //   leading: Icon(
            //     Icons.settings,
            //     color: Palette.orangeColor,
            //   ),
            //   title: Text(
            //     'My Settings',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            //   ),
            //   subtitle: Text(
            //     'View and modify your settings',
            //     style: TextStyle(fontSize: 12),
            //   ),
            //   trailing: Icon(CupertinoIcons.chevron_right,
            //       color: Palette.orangeColor),
            // ),
            // ListTile(
            //   onTap: () {
            //     RateMyApp(
            //             preferencesPrefix: 'rateMyApp_',
            //             minDays: 7,
            //             minLaunches: 10,
            //             remindDays: 7,
            //             remindLaunches: 10,
            //             googlePlayIdentifier: 'fr.skyost.example',
            //             appStoreIdentifier: '1491556149')
            //         .showRateDialog(
            //       context,
            //       title: 'Rate this app',
            //       // The dialog title.
            //       message:
            //           'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.', // The dialog message.
            //       rateButton: 'RATE', // The dialog "rate" button text.
            //       noButton: 'NO THANKS', // The dialog "no" button text.
            //       laterButton: 'MAYBE LATER', // The dialog "later" button text.
            //       listener: (button) {
            //         // The button click listener (useful if you want to cancel the click event).
            //         switch (button) {
            //           case RateMyAppDialogButton.rate:
            //             print('Clicked on "Rate".');
            //             break;
            //           case RateMyAppDialogButton.later:
            //             print('Clicked on "Later".');
            //             break;
            //           case RateMyAppDialogButton.no:
            //             print('Clicked on "No".');
            //             break;
            //         }

            //         return true; // Return false if you want to cancel the click event.
            //       },
            //       ignoreNativeDialog: Platform
            //           .isAndroid, // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
            //       dialogStyle: const DialogStyle(), // Custom dialog styles.
            //       onDismissed: () => RateMyApp().callEvent(RateMyAppEventType
            //           .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
            //       // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
            //       // actionsBuilder: (context) => [], // This one allows you to use your own buttons.
            //     );
            //   },
            //   leading: Icon(
            //     CupertinoIcons.star_fill,
            //     color: Palette.greenColor,
            //   ),
            //   title: Text(
            //     'Rate us',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            //   ),
            //   subtitle: Text(
            //     'Your valuable feedback fuels us',
            //     style: TextStyle(fontSize: 12),
            //   ),
            //   trailing: Icon(CupertinoIcons.chevron_right,
            //       color: Palette.orangeColor),
            // ),
            //
            Divider(),
            //   ListTile(
            //     onTap: () async {
            //       await launch(
            //           "https://www.kwikbasket.com/index.php?path=common/home/about_us#:~:text=KwikBasket's%20mission%20is%20to%20bring,Fruits%20%26%20Vegetables%20to%20our%20Customers.");
            //     },
            //     leading: Icon(
            //       CupertinoIcons.info,
            //       color: Palette.placeholderGrey,
            //     ),
            //     title: Text(
            //       'About Us',
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            //     ),
            //     subtitle: Text(
            //       'Know us better, read the T&C and policies',
            //       style: TextStyle(fontSize: 12),
            //     ),
            //     trailing: Icon(CupertinoIcons.chevron_right,
            //         color: Palette.orangeColor),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}
