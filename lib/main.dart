import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import 'package:tradelaw/core/Utils/binding.dart';
import 'package:tradelaw/core/Utils/size_config.dart';
import 'package:tradelaw/core/localization/translations.dart';
import 'package:tradelaw/core/theme/thems.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/language_controller.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/theme_controller.dart';
import 'package:tradelaw/features/view/auth/login%20page/loginpage.dart';
import 'package:tradelaw/features/view/home/home_page.dart';
import 'package:tradelaw/myrouts.dart';
import 'package:app_links/app_links.dart';

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

class TradeLaw extends StatefulWidget {
  const TradeLaw({super.key, required this.prefs});
  final SharedPreferences prefs;

  @override
  State<TradeLaw> createState() => _TradeLawState();
}

class _TradeLawState extends State<TradeLaw> {
  late AppLinks _appLinks;
  StreamSubscription? _linkSubscription;

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  void _initDeepLinks() async {
    // Initialize AppLinks
    _appLinks = AppLinks();
    
    // Handle deep links when app is already running
    _linkSubscription = _appLinks.allUriLinkStream.listen((uri) {
      _handleDeepLink(uri.toString());
    }, onError: (err) {
      print('Deep link error: $err');
    });
  
    // Handle deep link when app is launched from terminated state
    try {
      final initialUri = await _appLinks.getInitialAppLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri.toString());
      }
    } catch (e) {
      print('Initial link error: $e');
    }
  }

  void _handleDeepLink(String link) {
    print('Received deep link: $link');
    
    try {
      final uri = Uri.parse(link);
      
      if (uri.path.contains('/reset-password')) {
        // Extract tokens from the URL fragment
        final fragment = uri.fragment;
        if (fragment.isNotEmpty) {
          final params = Uri.splitQueryString(fragment);
          final accessToken = params['access_token'];
          final refreshToken = params['refresh_token'];
          
          if (accessToken != null && refreshToken != null) {
            // Use the correct method to recover session
            Supabase.instance.client.auth.recoverSession(accessToken);
            
            // Navigate to reset password page with a delay to ensure context is ready
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.toNamed('/reset-password');
            });
          }
        }
      }
    } catch (e) {
      print('Error handling deep link: $e');
    }
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put<ThemeController>(
      ThemeController(),
      permanent: true,
    );
    final languageController = Get.put<LanguageController>(
      LanguageController(widget.prefs),
      permanent: true,
    );

    final supabase = Supabase.instance.client;

    return GetMaterialApp(
      title: 'TradeLaw',
      theme: Themes().lightmode,
      darkTheme: Themes().darkmode,
      // Fixed the theme mode logic with proper AppTheme enum usage
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
      locale: Locale(languageController.language.value),
      fallbackLocale: const Locale('en', 'US'),
      builder: (context, child) {
        Sizeconfig().init(context);
        return child!;
      },
    );
  }
}