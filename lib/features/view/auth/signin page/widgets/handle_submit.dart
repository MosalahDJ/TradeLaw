import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/signincontroller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';

class SignInSubmitHandler {
  final SignInController signinctrl = Get.put<SignInController>(
    SignInController(),
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
      signinctrl.signin(context);
    }
  }
}
