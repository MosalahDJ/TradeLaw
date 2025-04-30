import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/logincontroller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';
import 'package:tradelaw/features/view/auth/login%20page/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LogInController loginctrl = Get.put<LogInController>(LogInController());
  final Txtvalcontroller txtvalctrl = Get.put<Txtvalcontroller>(
    Txtvalcontroller(),
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
                      content: Text('leave_login'.tr),
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
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            "login".tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          backgroundColor: Get.isDarkMode ? kmaincolor3dark : kmaincolor,
        ),
        body: LoginBody(),
      ),
    );
  }
}
