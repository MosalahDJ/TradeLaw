import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/auth_controller.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/language_controller.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/theme_controller.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    // LanguageController
    final prefs = await SharedPreferences.getInstance();
    Get.put(LanguageController(prefs), permanent: true);
    Get.put<AuthController>(AuthController());
  }
}
