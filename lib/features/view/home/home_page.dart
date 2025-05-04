import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:tradelaw/core/Utils/size_config.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/language_controller.dart';
import 'package:tradelaw/features/view%20model/settings%20controllers/theme_controller.dart';
import 'package:tradelaw/features/view/auth/login%20page/loginpage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ThemeController themectrl = Get.find();
  final LanguageController langctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    // Initialize Sizeconfig to avoid null errors
    Sizeconfig().init(context);

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              themectrl.selectedTheme.value == AppTheme.dark
                  ? kmaincolor3dark
                  : kmaincolor,
          title: Text(
            'Dashboard'.tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(
                themectrl.selectedTheme.value == AppTheme.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Colors.white,
              ),
              onPressed: () {
                themectrl.changeTheme(
                  themectrl.selectedTheme.value == AppTheme.light
                      ? AppTheme.dark
                      : AppTheme.light,
                );
              },
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.language_rounded, color: Colors.white),
              onSelected: (String value) {
                langctrl.changeLanguage(value);
              },
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'en',
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color:
                                langctrl.language.value == 'en'
                                    ? (themectrl.selectedTheme.value ==
                                            AppTheme.dark
                                        ? kmaincolor4dark
                                        : kmaincolor)
                                    : Colors.transparent,
                          ),
                          SizedBox(width: 8),
                          Text('english'.tr),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'ar',
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color:
                                langctrl.language.value == 'ar'
                                    ? (themectrl.selectedTheme.value ==
                                            AppTheme.dark
                                        ? kmaincolor4dark
                                        : kmaincolor)
                                    : Colors.transparent,
                          ),
                          SizedBox(width: 8),
                          Text('arabic'.tr),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'fr',
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color:
                                langctrl.language.value == 'fr'
                                    ? (themectrl.selectedTheme.value ==
                                            AppTheme.dark
                                        ? kmaincolor4dark
                                        : kmaincolor)
                                    : Colors.transparent,
                          ),
                          SizedBox(width: 8),
                          Text('french'.tr),
                        ],
                      ),
                    ),
                  ],
            ),
            IconButton(
              icon: Icon(Icons.logout_rounded, color: Colors.white),
              onPressed: () {
                // Handle profile
                Get.offAll(
                  () => LoginPage(),
                  duration: Duration(milliseconds: 500),
                  transition: Transition.leftToRight,
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome'.tr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color:
                        themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.white
                            : Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Explore our services'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.white70
                            : Colors.black54,
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildGridItem(
                        icon:
                            Icons
                                .shopping_bag_outlined, // Changed from gavel to shopping_bag_outlined
                        title: 'products'.tr,
                        color: Colors.blue.shade700,
                        onTap: () {
                          Get.toNamed("products");
                        },
                      ),
                      _buildGridItem(
                        icon:
                            Icons
                                .report_outlined, // Changed from description_outlined to report_outlined
                        title: 'reporting'.tr,
                        color: Colors.green.shade700,
                        onTap: () {
                          // Navigate to documents screen
                          Get.toNamed("reporting");
                        },
                      ),
                      _buildGridItem(
                        icon:
                            Icons
                                .track_changes, // Changed from people_outline to track_changes
                        title: 'report_tracking'.tr,
                        color: Colors.orange.shade700,
                        onTap: () {
                          // Navigate to consultants screen
                          Get.toNamed("tracking");
                        },
                      ),
                      _buildGridItem(
                        icon:
                            Icons
                                .balance, // Fixed syntax error and changed to balance
                        title: 'law_info'.tr,
                        color: Colors.purple.shade700,
                        onTap: () {
                          // Navigate to appointments screen
                          Get.toNamed("law_info");
                        },
                      ),
                      _buildGridItem(
                        icon:
                            Icons
                                .info_outline, // Changed from info to info_outline
                        title: 'info'.tr,
                        color: Colors.red.shade700,
                        onTap: () {
                          // Navigate to articles screen
                          Get.toNamed("info");
                        },
                      ),
                      _buildGridItem(
                        icon:
                            Icons
                                .support_agent, // Changed from help to support_agent
                        title: 'help&fedback'.tr,
                        color: const Color(0xFF616161),
                        onTap: () {
                          // Navigate to settings screen
                          Get.toNamed("help");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color:
                themectrl.selectedTheme.value == AppTheme.dark
                    ? Colors.grey.shade800
                    : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      themectrl.selectedTheme.value == AppTheme.dark
                          ? Colors.white
                          : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
