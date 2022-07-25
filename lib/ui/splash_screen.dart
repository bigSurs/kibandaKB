import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Positioned(
          left: 200,
          right: 200,
          top: 200,
          child: Center(
            child: SpinKitCircle(
              color: Palette.greenColor,
            ),
          ),
        ),
        const Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Center(
            child: Text.rich(TextSpan(
                text: 'Kwik ',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Palette.orangeColor),
                children: [
                  TextSpan(
                      text: 'Delivery',
                      style: TextStyle(color: Palette.greenColor))
                ])),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: Image.asset(
              'assets/truck_image.png',
              width: MediaQuery.of(context).size.width + 20,
            ))
      ],
    ));
  }
}