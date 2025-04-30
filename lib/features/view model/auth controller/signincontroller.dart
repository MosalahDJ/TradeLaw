import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signincontroller extends GetxController {
  // Text Controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  final TextEditingController gendre = TextEditingController();

  // Focus Nodes
  final FocusNode emailfnodesign = FocusNode();
  final FocusNode passwordfnodesign = FocusNode();
  final FocusNode passwordfnodesign2 = FocusNode();
  final FocusNode namefnode = FocusNode();
  final FocusNode lastnamefnode = FocusNode();
  final FocusNode gendrefnode = FocusNode();

  // State variables
  bool isLoading = false;
  bool visibility = false;
  bool visibility2 = false;

  // Password visibility toggle functions
  void visibilityfunc() {
    visibility = !visibility;
    update();
  }

  void visibilityfunc2() {
    visibility2 = !visibility2;
    update();
  }

  // Keyboard focus management
  void unfocuskeyboardsignin() {
    emailfnodesign.unfocus();
    passwordfnodesign.unfocus();
    passwordfnodesign2.unfocus();
    namefnode.unfocus();
  }
}
