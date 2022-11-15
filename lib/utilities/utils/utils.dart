import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:kibanda_kb/AppConstants.dart';
import 'package:kibanda_kb/app/alert/alert.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';

import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

// Date Time
const formatYYmd = 'dd MMM, yyyy';
const formatYMD = 'yyyy-MM-dd';
const message_no_net = 'Network connection required to fetch data.';

String getDateByFormat(DateTime dateTime) {
  return DateFormat(formatYYmd).format(dateTime);
}

String getDate(DateTime dateTime) {
  return DateFormat(formatYMD).format(dateTime);
}

DateTime getDateTime(dateTime) {
  return DateFormat("yyyy-MM-dd").parse(dateTime);
}

num? getNumPrice(String str) {
  return num.tryParse(str.toString().replaceAll(',', ''));
}

num? getNumPrice2(String str) {
  var str2 = num.tryParse(str.replaceAll('KES ', ''));
  return num.tryParse(str2.toString().replaceAll(',', ''));
}

String numberFunction(number) {
  NumberFormat format =
      NumberFormat.currency(decimalDigits: 1, customPattern: "0.0");

  String amountString = format.format(number);
  return amountString;
}

String numberCartFunction(number) {
  NumberFormat format =
      NumberFormat.currency(decimalDigits: 2, customPattern: "0.00");

  String amountString = format.format(number);
  return amountString;
}

num? decimalToNum(number) {
  NumberFormat format = NumberFormat();
  format.minimumFractionDigits = 0;

  String str = format.format(number);
  return num.tryParse(str);
}

// Connectivity

Connectivity connectivity = Connectivity();

Future<bool> isConnectNetworkWithMessage(BuildContext context) async {
  var connectivityResult = await connectivity.checkConnectivity();
  bool isConnect = getConnectionValue(connectivityResult);
  if (!isConnect) {
    AppToast.showToast(
        message: 'Network connection required to fetch data', isError: false);
  }
  return isConnect;
}

bool getConnectionValue(var connectivityResult) {
  bool status = false;
  switch (connectivityResult) {
    case ConnectivityResult.mobile:
      status = true;
      break;
    case ConnectivityResult.wifi:
      status = true;
      break;
    case ConnectivityResult.none:
      status = false;
      break;
    default:
      status = false;
      break;
  }
  return status;
}

Future<bool> isConnectNetwork() async {
  var connectivityResult = await connectivity.checkConnectivity();
  bool isConnect = getConnectionValue(connectivityResult);
  return isConnect;
}

// Keyboard

openKeyBoard(BuildContext context, FocusNode focusNode) {
  FocusScope.of(context).requestFocus(focusNode);
  // SystemChannels.textInput.invokeMethod('TextInput.hide');
}

// Platform channel

const platform = const MethodChannel('flutter.native/app_route');

goToMainNativePage() async {
  // ignore: unused_local_variable
  var result;
  try {
    result = await platform.invokeMethod(
        AppToast.showToast(message: 'native_go_to_main_page', isError: false));
  } on PlatformException catch (e) {
    print(e);
  }
}

// Files

String getFileNameFromPath(String file) {
  String path = file;
  return path.substring(path.lastIndexOf("/") + 1, path.length);
}

Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
}

Future<loc.LocationData> getLoaction() async {
  loc.Location location = new loc.Location();

  bool _serviceEnabled;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      throw "Service not enabled";
    }
  }

  return await location.getLocation();
}

Future<bool> isLocationPermission() async {
  if (await Permission.location.isGranted) {
    return true;
  }

  if (await Permission.location.isDenied) {
    return await Permission.location.request().isGranted;
  }
  return false;
}

Future<bool> isStoragePermission() async {
  if (await Permission.storage.isDenied) {
    await Permission.storage.request();
  }
  return true;
}

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

// void downloadFunction(url, context) async {
//   if (await Permission.storage.isDenied) {
//     if (await Permission.storage.request().isDenied) {
//       await permissionDialog(context, "Storage Permission");
//     }
//   }

//   if (await Permission.storage.request().isGranted) {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String _localPath = appDocDir.path;

//     final savedDir = Directory(_localPath);
//     bool hasExisted = savedDir.existsSync();
//     if (!hasExisted) {
//       savedDir.create();
//     }
//     var header = {'X-User': 'customer'};
//     header.addAll({"Authorization": AppSingleTone().userToken!});
//     await FlutterDownloader.enqueue(
//       url: "$url",
//       savedDir: _localPath,
//       headers: header,
//       showNotification: true,
//       openFileFromNotification: false,
//     );
//     messageTost("Download Start ...");
//   } else {
//     messageTost(Constants.storage_permission_required);
//   }
//   print(AppSingleTone().userToken);
// }

extension KBStringExtensions on String {
  String toBase64() {
    return base64.encode(utf8.encode(this));
  }
}
