import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/login_controller.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/language_controller.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/theme_controller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';


class Mybinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<LoginController>(LoginController());
  Get.put<Txtvalcontroller>(Txtvalcontroller());
    Get.put<ThemeController>(ThemeController(), permanent: true);
    final prefs = await SharedPreferences.getInstance();
    Get.put(LanguageController(prefs), permanent: true);
  }
}
