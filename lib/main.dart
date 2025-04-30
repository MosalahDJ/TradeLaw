import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:tradelaw/core/Utils/binding.dart';
import 'package:tradelaw/core/localization/translations.dart';
import 'package:tradelaw/core/theme/thems.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/theme_controller.dart';
import 'package:tradelaw/myrouts.dart';

// messaging background handler

void main() {
  // Force portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(TradeLaw());
}

class TradeLaw extends StatelessWidget {
  const TradeLaw({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QuranLife',

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
      home: const SplashView(),
      getPages: Myrouts.getpages,
      translations: Messages(),
      locale: Locale(languageController.language.value), // Use stored language
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
