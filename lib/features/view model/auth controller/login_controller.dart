import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final _googleSignIn = GoogleSignIn();
  final _supabase = Supabase.instance.client;

  // Add these controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailfnode = FocusNode();
  final passwordfnode = FocusNode();

  void unfocusKeyboard() {
    // This will remove focus from any text field and dismiss the keyboard
    emailfnode.unfocus();
    passwordfnode.unfocus();
  }

  // Observable states
  final isLoading = false.obs;
  final isAuthenticated = false.obs;
  final user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    // Listen to auth state changes
    _supabase.auth.onAuthStateChange.listen((event) {
      user.value = event.session?.user;
      isAuthenticated.value = user.value != null;
    });
  }

  // Add observable for password visibility
  final RxBool _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;
  // Add toggle function
  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update(); // Notify GetX to update the UI
  }

  // Email & Password Login
  Future<void> signInWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        emailController.clear();
        passwordController.clear();
        Get.offAllNamed('/home'); // Navigate to home screen
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      isLoading.value = true;
      await _supabase.auth.resetPasswordForEmail(email);
      Get.snackbar(
        'Success',
        'Password reset link sent to your email',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());

      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      isLoading.value = true;
      await _supabase.auth.signOut();
      await _googleSignIn.signOut();
      Get.offAllNamed('/login');
      isLoading.value = false;
    } catch (e) {
      print(e.toString());

      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    // Clean up focus nodes
    emailController.dispose();
    passwordController.dispose();
    emailfnode.dispose();
    passwordfnode.dispose();
    super.onClose();
  }
}
