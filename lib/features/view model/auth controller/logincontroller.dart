import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  // Controllers for user input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State management
  final RxBool isLoading = false.obs;

  // Focus nodes for form fields
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  // Toggles password visibility
  bool isPasswordVisible = true;
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  // Unfocus keyboard
  void unfocusKeyboard() {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  // User login function
  Future<void> login(BuildContext context) async {
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        isLoading.value = true;
        Get.offAllNamed("home");
        emailController.clear();
        passwordController.clear();
      } else {
        _showDialog(
          context,
          'please_enter_email'.tr,
          'please_enter_email'.tr,
          DialogType.info,
        );
      }
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
