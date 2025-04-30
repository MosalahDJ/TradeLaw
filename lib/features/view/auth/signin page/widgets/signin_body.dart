import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:tradelaw/core/Utils/size_config.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/signincontroller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';
import 'package:tradelaw/features/view/auth/signin%20page/widgets/handle_submit.dart';
import 'package:tradelaw/features/view/auth/signin%20page/widgets/signin_form_helper.dart';

class SigneinPageBody extends StatelessWidget {
  SigneinPageBody({super.key});

  final SignInController signinctrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();
  final SignInSubmitHandler _submitHandler = SignInSubmitHandler();
  final SignInFormHelpers signInFormHelpers = SignInFormHelpers();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizeconfig.screenwidth! * 0.05,
        vertical: Sizeconfig.screenheight! * 0.02,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Branding section with improved spacing
            Container(
              margin: EdgeInsets.only(
                top: Sizeconfig.screenheight! * 0.02,
                bottom: Sizeconfig.screenheight! * 0.04,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Sizeconfig.screenheight! * 0.15,
                    child: Image.asset(
                      "lib/core/assets/images/app_logo/pnglogo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "create_account".tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                          Get.isDarkMode
                              ? const Color(0xFFE5AB57)
                              : const Color(0xFF3D3825),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "fill_form".tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            Card(
              elevation: 2, // Added subtle elevation
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Get.isDarkMode ? kmaincolor3dark : Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Name Fields Row
                      Row(
                        children: [
                          Expanded(
                            child: signInFormHelpers.buildFormField(
                              context,
                              title: "first_name".tr,
                              hint: "enter_first_name".tr,
                              controller: signinctrl.name,
                              focusNode: signinctrl.namefnode,
                              formKey: txtvalctrl.signinnamestate,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: signInFormHelpers.buildFormField(
                              context,
                              title: "last_name".tr,
                              hint: "enter_last_name".tr,
                              controller: signinctrl.lastname,
                              focusNode: signinctrl.lastnamefnode,
                              formKey: txtvalctrl.signinlastnamestate,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Gender Dropdown
                      signInFormHelpers.buildGenderDropdown(),
                      const SizedBox(height: 20),

                      // Email field
                      signInFormHelpers.buildFormField(
                        context,
                        title: "email".tr,
                        hint: "enter_email".tr,
                        controller: signinctrl.emailcontroller,
                        focusNode: signinctrl.emailfnodesign,
                        formKey: txtvalctrl.signinemailstate,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),

                      // Password fields
                      GetBuilder<SignInController>(
                        builder:
                            (c) => signInFormHelpers.buildPasswordField(
                              context,
                              title: "password".tr,
                              hint: "enter_password".tr,
                              obsecure: signinctrl.visibility,
                              controller: signinctrl.password,
                              formKey: txtvalctrl.signinpasswordstate,
                              isConfirmation: false,
                            ),
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<SignInController>(
                        builder:
                            (c) => signInFormHelpers.buildPasswordField(
                              context,
                              title: "confirm_password".tr,
                              hint: "enter_password".tr,
                              obsecure: signinctrl.visibility2,
                              controller: signinctrl.password2,
                              formKey: txtvalctrl.signinpasswordstate2,
                              isConfirmation: true,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            GetBuilder<SignInController>(
              builder:
                  (controller) => ElevatedButton(
                    onPressed:
                        controller.isLoading.value
                            ? null
                            : () => _submitHandler.handleSubmit(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Get.isDarkMode ? kmaincolor4 : kmaincolor3dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:
                        controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : Text(
                              "create_account_button".tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
