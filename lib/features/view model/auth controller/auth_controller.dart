import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _googleSignIn = GoogleSignIn();
  
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

  // Email & Password Login
  Future<void> signInWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        Get.offAllNamed('/home'); // Navigate to home screen
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Email & Password Signup
  Future<void> signUpWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        Get.snackbar('Success', 'Please verify your email',
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = 
          await googleUser.authentication;

      final response = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
      );

      if (response.user != null) {
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Anonymous Login
  Future<void> signInAnonymously() async {
    try {
      isLoading.value = true;
      final response = await _supabase.auth.signInAnonymously();
      if (response.user != null) {
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
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
        snackPosition: SnackPosition.BOTTOM
      );
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
      await _googleSignIn.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}