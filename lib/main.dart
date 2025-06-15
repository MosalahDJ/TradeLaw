import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:app_links/app_links.dart';
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
    _linkSubscription = _appLinks.allUriLinkStream.listen(
      (uri) {
        _handleDeepLink(uri.toString());
      },
      onError: (err) {
        print('Deep link error: $err');
      },
    );

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

  void _handleDeepLink(String link) async {
    print('Received deep link: $link');

    try {
      final uri = Uri.parse(link);

      // Check if this is an auth callback
      if (uri.host == 'auth-callback' && uri.scheme == 'com.trade.lawe') {
        await _handleAuthCallback(uri);
      }
    } catch (e) {
      print('Error handling deep link: $e');
      _handleDeepLinkError('Failed to process authentication link');
    }
  }

  Future<void> _handleAuthCallback(Uri uri) async {
    try {
      print('Processing auth callback: $uri');
      print('URI fragment: ${uri.fragment}');

      // Extract the type parameter first to understand the intent
      final fragment = uri.fragment;
      final params = Uri.splitQueryString(fragment);
      final type = params['type'];

      print('Extracted type: $type');
      print('All params: $params');

      // Use Supabase's built-in method to handle the URL
      final response = await Supabase.instance.client.auth.getSessionFromUrl(
        uri,
      );

      print('Session recovered successfully');
      print('User: ${response.session.user?.email}'); // Using the response here
      print('Session expires at: ${response.session?.expiresAt}'); // And here

      // Navigate based on the type with more specific checking
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (type == 'recovery' || uri.path.contains('reset-password')) {
          print('Navigating to reset-password page');
          Get.offAllNamed('/reset-password');
        } else if (type == 'signup' || type == 'invite') {
          print('Navigating to login page for signup/invite');
          Get.offAllNamed('/login');
        } else {
          print('Unknown type, navigating to login page');
          Get.offAllNamed('/login');
        }
      });
    } on AuthException catch (authError) {
      print('Auth error during session recovery: ${authError.message}');

      // Check if this is a password reset link even if session recovery failed
      final fragment = uri.fragment;
      final params = Uri.splitQueryString(fragment);
      final type = params['type'];

      if (type == 'recovery' || uri.path.contains('reset-password')) {
        // For password reset, we might not need a valid session initially
        print(
          'Password reset detected, navigating to reset-password page despite auth error',
        );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAllNamed('/reset-password');
        });
      } else {
        // Handle other auth errors
        if (authError.message.contains('Code verifier') ||
            authError.message.contains('expired')) {
          _handleDeepLinkError(
            'Reset password link has expired. Please request a new one.',
          );
        } else {
          _handleDeepLinkError('Authentication failed: ${authError.message}');
        }
      }
    } catch (e) {
      print('Unexpected error during session recovery: $e');

      // Check if this is a password reset link even if there's an unexpected error
      final fragment = uri.fragment;
      final params = Uri.splitQueryString(fragment);
      final type = params['type'];

      if (type == 'recovery' || uri.path.contains('reset-password')) {
        print(
          'Password reset detected, navigating to reset-password page despite error',
        );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAllNamed('/reset-password');
        });
      } else {
        _handleDeepLinkError('An unexpected error occurred. Please try again.');
      }
    }
  }

  void _handleDeepLinkError(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );

      // Navigate back to login page
      Get.offAllNamed('/login');
    });
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
