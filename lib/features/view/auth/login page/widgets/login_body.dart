import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:tradelaw/core/Utils/size_config.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/logincontroller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';
import 'package:tradelaw/features/view/auth/signin%20page/signin_page.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final LogInController loginctrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizeconfig.screenwidth! * 0.06,
              vertical: Sizeconfig.screenheight! * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                Center(
                  child: Image.asset(
                    "lib/core/assets/images/app_logo/newlogo.jpg",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Welcome Text
                Center(
                  child: Text(
                    "welcome_back".tr,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    "see_you_again".tr,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.06),

                // Email Field
                Form(
                  key: txtvalctrl.loginemailstate,
                  child: _buildTextField(
                    controller: loginctrl.emailController,
                    hintText: "enter_email".tr,
                    focusNode: loginctrl.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        (val) =>
                            val!.isEmpty ? "Please ${"enter_email".tr}" : null,
                  ),
                ),

                SizedBox(height: 16),

                // Password Field
                Form(
                  key: txtvalctrl.loginpasswordstate,
                  child: GetBuilder<LogInController>(
                    builder:
                        (controller) => _buildTextField(
                          controller: loginctrl.passwordController,
                          hintText: "enter_password".tr,
                          focusNode: loginctrl.passwordFocusNode,
                          obscureText: loginctrl.isPasswordVisible,
                          validator:
                              (val) =>
                                  val!.isEmpty
                                      ? "Please ${"enter_password".tr}"
                                      : null,
                          suffixIcon: IconButton(
                            onPressed: loginctrl.togglePasswordVisibility,
                            icon: Icon(
                              loginctrl.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                            ),
                          ),
                        ),
                  ),
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      loginctrl.unfocusKeyboard();
                      // Forgot password function
                    },
                    child: Text(
                      "forgot_password".tr,
                      style: TextStyle(
                        color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Get.isDarkMode ? kmaincolor4 : kmaincolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (txtvalctrl.loginemailstate.currentState!.validate() &&
                          txtvalctrl.loginpasswordstate.currentState!
                              .validate()) {
                        loginctrl.isLoading.value
                            ? null
                            : loginctrl.unfocusKeyboard();
                        loginctrl.isLoading.value
                            ? null
                            : loginctrl.login(context);
                      }
                    },
                    child: Obx(
                      () =>
                          loginctrl.isLoading.value
                              ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Get.isDarkMode ? kmaincolor : kmaincolor4,
                                ),
                              )
                              : Text(
                                "login".tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                    ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Or Login with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color:
                            Get.isDarkMode
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or_login_with".tr,
                        style: TextStyle(
                          color:
                              Get.isDarkMode
                                  ? Colors.grey[400]!
                                  : Colors.grey[600]!,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color:
                            Get.isDarkMode
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Social Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialLoginButton(
                      icon: "lib/core/assets/images/login_images/google.png",
                      onTap: () => loginctrl.logwithsocial(context),
                    ),
                    SizedBox(width: 20),
                    _buildSocialLoginButton(
                      icon: "lib/core/assets/images/login_images/Guest.png",
                      onTap: () => loginctrl.logwithsocial(context),
                    ),
                    SizedBox(width: 20),
                    _buildSocialLoginButton(
                      icon:
                          "lib/core/assets/images/login_images/apple.png", // Asegúrate de tener este archivo
                      onTap: () {
                        loginctrl.logwithsocial(context);
                      },
                    ),
                  ],
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "no_account".tr,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        loginctrl.unfocusKeyboard();
                        Get.offAll(
                          () => SigninPage(),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Text(
                        "sign_in".tr,
                        style: TextStyle(
                          color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // New method for text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black87),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[500],
        ),
        filled: true,
        fillColor:
            Get.isDarkMode
                ? Colors.grey[800]!.withValues(alpha: 0.5)
                : Colors.grey[100]!,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        suffixIcon: suffixIcon,
      ),
    );
  }

  // New method for social login buttons
  Widget _buildSocialLoginButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Center(child: Image.asset(icon, height: 30, width: 30)),
      ),
    );
  }
}
