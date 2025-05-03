import 'package:get/get.dart';
import 'package:tradelaw/features/view/auth/login%20page/loginpage.dart';
import 'package:tradelaw/features/view/auth/signin%20page/signin_page.dart';
import 'package:tradelaw/features/view/home/home_page.dart';

class Myrouts {
  static List<GetPage<dynamic>> get getpages {
    return [
      GetPage(name: "/login", page: () => LoginPage()),
      GetPage(name: "/signin", page: () => SigninPage()),
      GetPage(name: "/home", page: () => HomePage()),
    ];
  }
}
