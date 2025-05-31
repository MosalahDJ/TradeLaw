import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/auth_controller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';

class SignInSubmitHandler {
  final AuthController signinctrl = Get.put<AuthController>(
    AuthController(),
  );

  final Txtvalcontroller txtvalctrl = Get.put<Txtvalcontroller>(
    Txtvalcontroller(),
  );

  void handleSubmit(BuildContext context) {
    signinctrl.unfocuskeyboardsignin();

    // Validate all forms
    bool isValid =
        txtvalctrl.signinnamestate.currentState!.validate() &&
        txtvalctrl.signinlastnamestate.currentState!.validate() &&
        txtvalctrl.signingendrestate.currentState!.validate() &&
        txtvalctrl.signinemailstate.currentState!.validate() &&
        txtvalctrl.signinpasswordstate.currentState!.validate() &&
        txtvalctrl.signinpasswordstate2.currentState!.validate();

    if (isValid) {
      signinctrl.signUpWithEmail(
        signinctrl.emailController.text,
        signinctrl.passwordController.text,
      );
    }
  }
}
