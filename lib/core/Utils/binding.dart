import 'package:get/get.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/login_controller.dart';
import 'package:tradelaw/features/view%20model/auth%20controller/textvalidatecontroller.dart';
// Add this import if not already present
import 'package:tradelaw/features/view%20model/auth%20controller/deep_link_controller.dart';

// In your Mybinding class, add:
class Mybinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<Txtvalcontroller>(Txtvalcontroller());
    Get.put(DeepLinkController(), permanent: true);
  }
}
