import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kibanda_kb/app/alert/alert.dart';
import 'package:kibanda_kb/app/theme/app_theme.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/constants/constants.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/widgets/PaynowMobileTextFormFeild.dart';
import 'package:permission_handler/permission_handler.dart';
class LoadingWidget extends StatefulWidget {
  LoadingWidget({Key? key, this.isBarrier = false}) : super(key: key);

  final bool isBarrier;

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.widget.isBarrier
              ? Colors.black.withOpacity(0.2)
              : Colors.transparent),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

AppBar appBar({
  String? title,
  List<Widget>? actions,
  bool? leading = false,
}) {
  return AppBar(
    automaticallyImplyLeading: leading!,
    elevation: 1,
    title: Text(
      title!,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Palette.greenColor,
          fontSize: 22.0),
    ),
    actions: actions,
    iconTheme: IconThemeData(color: Palette.greenColor),
    actionsIconTheme: IconThemeData(color: Palette.greenColor),
    backgroundColor: Colors.white,
  );
}

Icon addToCartButton({Function? onTap, Color? colour, bool inCart = false}) {
  return Icon(
    Icons.shopping_cart,
    color: colour,
    size: 18,
  );
}

Widget qtyTextBox(
    TextEditingController? controller,
    bool? isAllowDecimal,
    Function()? onEditingComplete,
    Function(String)? onFieldSubmitted,
    Function(String?)? onSave,
    Function(String?)? onChanged) {
  return Container(
    height: 35,
    width: 190,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Color(0xFFE5E5E5),
      ),
    ),
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      inputFormatters: [
        isAllowDecimal!
            ? FilteringTextInputFormatter.allow(RegExp(r"^[0-9]+.?[0-9]{0,2}"))
            : FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
      ],
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSave,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Enter the quantity",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        isDense: true,
      ),
    ),
  );
}

GestureDetector notesButton(
    BuildContext context, Function() onTap, double width,
    {bool isNote = false}) {
  return GestureDetector(
    child: Card(
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            ImageIcon(
              AssetImage("assets/icon/note.png"),
              color: AppTheme.colorGrey,
              size: 20,
            ),
            SizedBox(
              width: width,
            ),
            Text('Notes')
          ],
        ),
      ),
    ),
    onTap: onTap,
  );
}

Future notesDialogBox(BuildContext context, TextEditingController controller,
    {isCart = false, String? qty}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: AppTheme.colorDarkGrey,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
            ),
            Icon(
              Icons.list_alt_rounded,
              size: 72,
              color: AppTheme.colorGreen,
            ),
            Text(
              isCart ? Constants.add_order_notes : Constants.add_product_notes,
              style: TextStyle(
                color: AppTheme.colorDarkGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Constants.heightSizeBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: controller,
                minLines: 5,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: Constants.write_your_notes,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
            Constants.heightSizeBox,
            GestureDetector(
              onTap: () {
                if (!isCart) {
                  if (qty == "0" || qty!.isEmpty) {
                    messageTost(Constants.enter_qty);
                  } else {
                    Navigator.of(context).pop(true);
                  }
                } else {
                  Navigator.of(context).pop(true);
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: Constants.padding,
                decoration: BoxDecoration(
                  color: AppTheme.colorGreen,
                ),
                width: double.infinity,
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: AppTheme.colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Future pendingPayNowMpesaBox(BuildContext context,
    TextEditingController controller, TextEditingController controllerPhone) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: AppTheme.colorDarkGrey,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
            ),
            // Icon(
            //   Icons.list_alt_rounded,
            //   size: 72,
            //   color: AppTheme.colorGreen,
            // ),
            Text(
              "mPesa Online",
              style: TextStyle(
                color: AppTheme.colorDarkGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Constants.heightSizeBox,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: PaynowMobileTextFormField(
                    padding: EdgeInsets.all(8),
                    label: Constants.phone_number_code,
                    readOnly: true,
                    enable: false,
                    // colour: Color(0xFFD9D7D7),
                    hintColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 4,
                  child: PaynowMobileTextFormField(
                    label: Constants.phone_number,
                    hintText: '712345678/112345678',
                    keyboardType: TextInputType.phone,
                    inptuFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: controllerPhone,
                    error: Constants.enter_valid_phone_number,
                    // serverError: this.model.serverError["telephone"],
                    validationFunction: phoneValidation,
                    readOnly: false,
                    enable: true,
                  ),
                ),
              ],
            ),
            Constants.heightSizeBox,
            GestureDetector(
              onTap: () {
                if (controllerPhone.text.length != 9) {
                  Navigator.of(context).pop(false);
                } else {
                  Navigator.of(context).pop(true);
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: Constants.padding,
                decoration: BoxDecoration(
                  color: AppTheme.colorGreen,
                ),
                width: double.infinity,
                child: Text(
                  "PAY & CONFIRM",
                  style: TextStyle(
                    color: AppTheme.colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

String? phoneValidation(String val) {
  if (val.length != 9) {
    // if (val.length <= 8 || val.length >= 12) {
    return Constants.enter_valid_phone_digits;
  }
}

Future productNotesDialogBox(
    BuildContext context, TextEditingController controller) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: AppTheme.colorDarkGrey,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
            ),
            Icon(
              Icons.list_alt_rounded,
              size: 72,
              color: AppTheme.colorGreen,
            ),
            Text(
              Constants.add_product_notes,
              style: TextStyle(
                color: AppTheme.colorDarkGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Constants.heightSizeBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: controller,
                minLines: 5,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: Constants.write_your_notes,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
            Constants.heightSizeBox,
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(true);
              },
              child: Container(
                alignment: Alignment.center,
                padding: Constants.padding,
                decoration: BoxDecoration(
                  color: AppTheme.colorGreen,
                ),
                width: double.infinity,
                child: Text(
                  Constants.add_button,
                  style: TextStyle(
                    color: AppTheme.colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Future addBasketDialogBox(
  BuildContext context,
  TextEditingController controller,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: AppTheme.colorDarkGrey,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
            ),
            Icon(
              Icons.shopping_basket,
              size: 72,
              color: AppTheme.colorGreen,
            ),
            Text(
              "Add Your Basket Name",
              style: TextStyle(
                color: AppTheme.colorDarkGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppTheme.colorDarkGrey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Basket Name",
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.text.isEmpty) {
                  messageTost("Please enter basket name..");
                } else {
                  Navigator.of(context).pop(true);
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: Constants.padding,
                decoration: BoxDecoration(
                  color: AppTheme.colorGreen,
                ),
                width: double.infinity,
                child: Text(
                  "Add to basket.",
                  style: TextStyle(
                    color: AppTheme.colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Center noData(String message) {
  return Center(
    child: Container(
      padding: Constants.padding,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppTheme.colorGrey),
      ),
    ),
  );
}

Text itemsInCart(item) {
  return Text.rich(
    TextSpan(
      text: "$item item in cart ",
      style: TextStyle(
        color: AppTheme.colorGrey,
      ),
    ),
  );
}

// Widget cartButton() {
//   return Consumer<CartProvider>(
//     builder: (_, cart, child) {
//       return GestureDetector(
//         child: Stack(
//           children: [
//             Padding(
//               padding: Constants.padding,
//               child: Icon(
//                 Icons.shopping_cart,
//                 size: 28,
//               ),
//             ),
//             if (cart.list.length > 0)
//               Positioned(
//                 top: 10,
//                 left: 24,
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppTheme.colorGreen,
//                   ),
//                   height: 15,
//                   width: 15,
//                   child: Text(
//                     "${cart.list.length}",
//                     style: const TextStyle(fontSize: 11),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//         onTap: () {
//           AutoRouter.of(_).push(CartRoute());
//           // Navigator.of(Constants.navigatorKey.currentContext!)
//           //     .pushNamed(PageRoutes.cart_page);
//         },
//       );
//     },
//   );
// }

// showReportDialog(
//   BuildContext context, {
//   String? orderId,
//   required String selectedIssue,
//   required TextEditingController textController,
//   required Function onSubmit,
// }) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         clipBehavior: Clip.hardEdge,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               color: AppTheme.colorGreen,
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding: EdgeInsets.only(right: 12, top: 12),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Icon(
//                         Icons.close,
//                         color: AppTheme.colorWhite,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     Constants.title_report_issue,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: AppTheme.colorWhite,
//                     ),
//                   ),
//                   if (orderId != null)
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         "Order Id : $orderId",
//                         style: const TextStyle(
//                             color: AppTheme.colorWhite, fontSize: 18),
//                       ),
//                     ),
//                   Constants.heightSizeBox,
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Row(
//                 children: [
//                   Text(
//                     Constants.issue_type,
//                     style: const TextStyle(
//                         color: AppTheme.colorDarkGrey, fontSize: 16),
//                   ),
//                   Constants.widthSizeBox,
//                   Expanded(
//                     child: UnitDropDown(
//                       density: true,
//                       value: selectedIssue,
//                       items: Constants.issueTypeList.map((item) {
//                         return DropdownMenuItem(
//                           child: new Text(
//                             item,
//                           ),
//                           value: item,
//                         );
//                       }).toList(),
//                       onChanged: (val) {
//                         selectedIssue = val;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Constants.heightSizeBox,
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppTheme.colorGrey, width: 1),
//               ),
//               child: TextField(
//                 controller: textController,
//                 minLines: 5,
//                 maxLines: 5,
//                 decoration: InputDecoration(
//                   hintText: Constants.issue_details,
//                   focusedBorder: InputBorder.none,
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             Constants.heightSizeBox,
//             ElevatedButton(
//               onPressed: () {
//                 onSubmit(selectedIssue);
//               },
//               child: Text(Constants.submit_button),
//               style: ElevatedButton.styleFrom(
//                 primary: AppTheme.colorGreen,
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//             ),
//             Constants.heightSizeBox,
//           ],
//         ),
//       );
//     },
//   );
// }

permissionDialog(BuildContext ctx, String msg) async {
  await showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: Text(
          msg,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        content: Text("Please Grant Permission for use KwikBasket"),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
              SystemNavigator.pop();
            },
          ),
          TextButton(
            child: Text('Settings'),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
          ),
        ],
      );
    },
  );
}
