import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/auth_controller.dart';
import 'package:tradelaw/features/view/auth/signin%20page/widgets/signin_body.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final AuthController signinctrl = Get.put<AuthController>(
    AuthController(),
  );
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          bool shouldPop =
              await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('are_you_sure'.tr),
                      content: Text('leave_registration'.tr),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('no'.tr),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('yes'.tr),
                        ),
                      ],
                    ),
              ) ??
              false;

          if (shouldPop) {
            Get.offAllNamed("login");
          }
        }
      },
      child: Scaffold(body: SigneinPageBody()),
    );
  }
}
