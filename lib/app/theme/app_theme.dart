import 'package:flutter/material.dart';
import 'package:kibanda_kb/configuration/configuration.dart';

class AppTheme {
  AppTheme._();

  static MaterialColor colorPrimaryMaterial =
      const MaterialColor(0xFFE67817, AppTheme.color);

  static const Map<int, Color> color = {
    50: Color.fromRGBO(170, 212, 0, .1),
    100: Color.fromRGBO(170, 212, 0, .2),
    200: Color.fromRGBO(170, 212, 0, .3),
    300: Color.fromRGBO(170, 212, 0, .4),
    400: Color.fromRGBO(170, 212, 0, .5),
    500: Color.fromRGBO(170, 212, 0, .6),
    600: Color.fromRGBO(170, 212, 0, .7),
    700: Color.fromRGBO(170, 212, 0, .8),
    800: Color.fromRGBO(170, 212, 0, .9),
    900: Color.fromRGBO(170, 212, 0, 1),
  };

  // f7941d
  static const Color colorPrimary = Palette.orangeColor;
  static const Color colorActionOrange = Color(0xFFF59C64);

  static const Color colorGreen = Palette.greenColor;
  static const Color errorColor = Colors.red;
  static const Color colorBlack = Colors.black;

  static const Color bottomNavBarColor = Color(0xFFF6F6F6);
  static const Color colorDarkOrange = Color(0xFFEA7024);
  static const Color navBarActiveIconColor = Color(0xFFE8721E);
  static const Color colorGrey = Color(0xFF999999);
  static const Color colorDarkGrey = Color(0xFF616161);
  static const Color colorLightGrey = Color(0xFFE0E0E0);
  static const Color colorYellow = Colors.yellow;
  static const Color colorOrange = Colors.orange;
  static const Color colorBrown = Color(0xFF974300);
  static const Color colorWhite = Colors.white;
  static const Color colorBlue = Color(0xFF5D77FF);
  static const Color colorPerpal = Color(0xFF583d5f);
  static const Color colorPink = Color(0xFFFFEDE2);

  static const String fontName = 'celias';
}
