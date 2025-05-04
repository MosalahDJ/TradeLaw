import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:tradelaw/core/Utils/size_config.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/signincontroller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';
import 'package:tradelaw/features/view/auth/login%20page/loginpage.dart';

class SigneinPageBody extends StatelessWidget {
  SigneinPageBody({super.key});

  final SignInController signinctrl = Get.find();
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
                // Back Button
                Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                          Get.isDarkMode
                              ? Colors.grey[700]!
                              : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Get.isDarkMode ? Colors.white : Colors.black87,
                      size: 20,
                    ),
                    onPressed: () {
                      signinctrl.unfocuskeyboardsignin();
                      Get.offAll(
                        () => LoginPage(),
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.leftToRight,
                      );
                    },
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Welcome Text
                Text(
                  "Hello! Register to get".tr,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "started".tr,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.05),

                // Username Field
                Form(
                  key: txtvalctrl.signinnamestate,
                  child: _buildTextField(
                    controller: signinctrl.name,
                    hintText: "Username".tr,
                    focusNode: signinctrl.namefnode,
                    validator:
                        (val) => val!.isEmpty ? "please_enter_name".tr : null,
                  ),
                ),

                SizedBox(height: 16),

                // Email Field
                Form(
                  key: txtvalctrl.signinemailstate,
                  child: _buildTextField(
                    controller: signinctrl.emailcontroller,
                    hintText: "Email",
                    focusNode: signinctrl.emailfnodesign,
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        (val) => val!.isEmpty ? "please_enter_email".tr : null,
                  ),
                ),

                SizedBox(height: 16),

                // Password Field
                Form(
                  key: txtvalctrl.signinpasswordstate,
                  child: GetBuilder<SignInController>(
                    builder:
                        (controller) => _buildTextField(
                          controller: signinctrl.password,
                          hintText: "Password",
                          focusNode: signinctrl.passwordfnodesign,
                          obscureText: signinctrl.visibility,
                          validator:
                              (val) =>
                                  val!.isEmpty
                                      ? "please_enter_password".tr
                                      : null,
                          suffixIcon: IconButton(
                            onPressed: signinctrl.visibilityfunc,
                            icon: Icon(
                              signinctrl.visibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                            ),
                          ),
                        ),
                  ),
                ),

                SizedBox(height: 16),

                // Confirm Password Field
                Form(
                  key: txtvalctrl.signinpasswordstate2,
                  child: GetBuilder<SignInController>(
                    builder:
                        (controller) => _buildTextField(
                          controller: signinctrl.password2,
                          hintText: "Confirm password",
                          focusNode: signinctrl.passwordfnodesign2,
                          obscureText: signinctrl.visibility2,
                          validator:
                              (val) =>
                                  val!.isEmpty
                                      ? "please_confirm_password".tr
                                      : null,
                          suffixIcon: IconButton(
                            onPressed: signinctrl.visibilityfunc2,
                            icon: Icon(
                              signinctrl.visibility2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                            ),
                          ),
                        ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Register Button
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
                      signinctrl.unfocuskeyboardsignin();
                      if (validateForms()) {
                        signinctrl.isLoading.value
                            ? null
                            : signinctrl.signin(context);
                      }
                    },
                    child: Obx(
                      () =>
                          signinctrl.isLoading.value
                              ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Get.isDarkMode ? kmaincolor : kmaincolor4,
                                ),
                              )
                              : Text(
                                "Register",
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

                // Or Register with
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
                        "Or Register with",
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
                      onTap: () {
                        signinctrl.signwithsocial(context);
                      },
                    ),
                    SizedBox(width: 20),
                    _buildSocialLoginButton(
                      icon: "lib/core/assets/images/login_images/Guest.png",
                      onTap: () {
                        signinctrl.signwithsocial(context);
                      },
                    ),
                    SizedBox(width: 20),
                    _buildSocialLoginButton(
                      icon: "lib/core/assets/images/login_images/apple.png",
                      onTap: () {
                        signinctrl.signwithsocial(context);
                      },
                    ),
                  ],
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        signinctrl.unfocuskeyboardsignin();
                        Get.offAll(
                          () => LoginPage(),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                        );
                      },
                      child: Text(
                        "Login Now",
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

  bool validateForms() {
    return txtvalctrl.signinnamestate.currentState!.validate() &&
        txtvalctrl.signinemailstate.currentState!.validate() &&
        txtvalctrl.signinpasswordstate.currentState!.validate() &&
        txtvalctrl.signinpasswordstate2.currentState!.validate();
  }

  // Text field widget
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
                ? Colors.grey[800]!.withOpacity(0.5)
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

  // Social login button widget
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
