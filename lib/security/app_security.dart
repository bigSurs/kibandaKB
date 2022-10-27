import 'package:kibanda_kb/utilities/toast/toast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AppSecurity {
  static Future<bool> authenticate(String message) async {
    var localAuth = LocalAuthentication();
    try {
      bool didAuthenticate = await localAuth.authenticate(
        localizedReason: message,
      );
      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // AppToast.showToast(message: auth_error.notAvailable, isError: true);
        return true;
      }
      if (e.code == auth_error.lockedOut) {
        AppToast.showToast(message: auth_error.lockedOut, isError: true);
      }
      if (e.code == auth_error.notEnrolled) {
        AppToast.showToast(message: auth_error.notEnrolled, isError: true);
      }
      if (e.code == auth_error.passcodeNotSet) {
        AppToast.showToast(message: auth_error.passcodeNotSet, isError: true);
      }
      if (e.code == auth_error.permanentlyLockedOut) {
        AppToast.showToast(
            message: auth_error.permanentlyLockedOut, isError: true);
      }
      return false;
    }
  }
}
