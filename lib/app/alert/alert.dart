import 'package:fluttertoast/fluttertoast.dart';
import 'package:kibanda_kb/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showMaterialDialogWithMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          message,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content:
            new Text(message, style: TextStyle(fontWeight: FontWeight.w500)),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new ElevatedButton(
            child: new Text(
              "OK",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showCupertinoDialogWithMessage(BuildContext context, String message) {
  showCupertinoDialog(
    context: context,
    builder: (context) => new CupertinoAlertDialog(
      title: Text(
        'Message',
        style: TextStyle(fontFamily: AppTheme.fontName),
      ),
      content: Text(
        message,
        style: TextStyle(fontFamily: AppTheme.fontName),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: new Text(
            'Ok',
            style: TextStyle(fontFamily: AppTheme.fontName),
          ),
        ),
      ],
    ),
  );
}

void messageTost(String message) async {
  await Fluttertoast.showToast(
    msg: "$message",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black26,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}
