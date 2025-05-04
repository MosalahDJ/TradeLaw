import 'package:get/get.dart';
import 'package:tradelaw/features/view/auth/login%20page/loginpage.dart';
import 'package:tradelaw/features/view/auth/signin%20page/signin_page.dart';
import 'package:tradelaw/features/view/home/home_page.dart';
import 'package:tradelaw/features/view/home/pages/help_and_fedback.dart';
import 'package:tradelaw/features/view/home/pages/info.dart';
import 'package:tradelaw/features/view/home/pages/lawinfo.dart';
import 'package:tradelaw/features/view/home/pages/products.dart';
import 'package:tradelaw/features/view/home/pages/report_tracking.dart';
import 'package:tradelaw/features/view/home/pages/reporting.dart';

class Myrouts {
  static List<GetPage<dynamic>> get getpages {
    return [
      GetPage(name: "/login", page: () => LoginPage()),
      GetPage(name: "/signin", page: () => SigninPage()),
      GetPage(name: "/home", page: () => HomePage()),
      GetPage(name: "/products", page: () => Products()),
      GetPage(name: "/reporting", page: () => Reporting()),
      GetPage(name: "/tracking", page: () => ReportTracking()),
      GetPage(name: "/law_info", page: () => Lawinfo()),
      GetPage(name: "/info", page: () => Info()),
      GetPage(name: "/help", page: () => Helpandfedback()),
    ];
  }
}
