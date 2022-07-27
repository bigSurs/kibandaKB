import 'package:flutter/material.dart';

import 'ios_style_toast.dart';

/// Example to show how to popup overlay with custom animation.
class CustomAnimationToast extends StatelessWidget {
  final double value;
  final String message;
  final bool isError;
  static final Tween<Offset> tweenOffset =
      Tween<Offset>(begin: const Offset(0, 40), end: const Offset(0, 0));

  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);

  const CustomAnimationToast(
      {Key? key,
      required this.value,
      required this.message,
      required this.isError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: tweenOffset.transform(value),
      child: Opacity(
        child: IosStyleToast(
          message: message,
          isError: isError,
        ),
        opacity: tweenOpacity.transform(value),
      ),
    );
  }
}
