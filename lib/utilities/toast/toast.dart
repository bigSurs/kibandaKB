import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';
import 'custom_animation_toast.dart';

class AppToast {
  static showToast({required String message, required bool isError}) {
    showOverlay((context, t) {
      return CustomAnimationToast(
        value: t,
        isError: isError,
        message: message,
      );
    }, key: const ValueKey('success'), curve: Curves.decelerate);
  }
}
