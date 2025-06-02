import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradelaw/core/Utils/binding.dart';
import 'package:tradelaw/core/Utils/size_config.dart';
import 'package:tradelaw/core/localization/translations.dart';
import 'package:tradelaw/core/theme/thems.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/language_controller.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/theme_controller.dart';
import 'package:tradelaw/features/view/auth/login%20page/loginpage.dart';
import 'package:tradelaw/features/view/home/home_page.dart';
import 'package:tradelaw/myrouts.dart';
// messaging background handler

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://juktdohsepycmmgtmddf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp1a3Rkb2hzZXB5Y21tZ3RtZGRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg3MDcxOTUsImV4cCI6MjA2NDI4MzE5NX0.n-AceFZf2IwAy8gq5-xawOjJ6KFVcC-AoY6lyIE69Yw',
  );

  final prefs = await SharedPreferences.getInstance();

  // Force portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(TradeLaw(prefs: prefs));
}

class TradeLaw extends StatelessWidget {
  const TradeLaw({super.key, required this.prefs});
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put<ThemeController>(
      ThemeController(),
      permanent: true,
    );
    final languageController = Get.put<LanguageController>(
      LanguageController(prefs),
      permanent: true,
    );

    final supabase = Supabase.instance.client;

    return GetMaterialApp(
      title: 'TradeLaw',

      theme: Themes().lightmode,
      darkTheme: Themes().darkmode,
      //using thememode for changing theme whene user change selected theme value
      themeMode:
          themeController.selectedTheme.value == AppTheme.system
              ? ThemeMode.system
              : themeController.selectedTheme.value == AppTheme.light
              ? ThemeMode.light
              : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialBinding: Mybinding(),
      home:
          supabase.auth.currentSession == null ? LoginPage() : const HomePage(),
      getPages: Myrouts.getpages,
      translations: Messages(),
      locale: Locale(languageController.language.value), // Use stored language
      fallbackLocale: const Locale('en', 'US'),
      builder: (context, child) {
        // Initialize Sizeconfig here
        Sizeconfig().init(context);
        return child!;
      },
    );
  }
}
