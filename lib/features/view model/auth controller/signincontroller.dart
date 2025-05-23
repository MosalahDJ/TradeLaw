import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
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
  final RxBool isLoading = false.obs;
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

  // User login function
  void signin(BuildContext context) {
    try {
      if (emailcontroller.text.isNotEmpty &&
          password.text.isNotEmpty &&
          password2.text.isNotEmpty &&
          name.text.isNotEmpty) {
        isLoading.value = true;
        emailcontroller.clear();
        password.clear();
        password2.clear();
        name.clear();
        Get.offAllNamed("home");
      } else {
        _showDialog(
          context,
          'fill_form_title'.tr,
          'fill_form'.tr,
          DialogType.info,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  void signwithsocial(BuildContext context) {
    try {
      isLoading.value = true;
      emailcontroller.clear();
      password.clear();
      password2.clear();
      name.clear();
      Get.offAllNamed("home");
    } finally {
      isLoading.value = false;
    }
  }

  // Show a dialog using AwesomeDialog
  void _showDialog(
    BuildContext context,
    String title,
    String desc,
    DialogType type,
  ) {
    AwesomeDialog(
      context: context,
      title: title,
      desc: desc,
      dialogType: type,
    ).show();
  }
}
