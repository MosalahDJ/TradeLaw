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

    return Obx(() => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themectrl.selectedTheme.value == AppTheme.dark ? kmaincolor3dark : kmaincolor,
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
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'en',
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: langctrl.language.value == 'en' 
                          ? (themectrl.selectedTheme.value == AppTheme.dark ? kmaincolor4dark : kmaincolor) 
                          : Colors.transparent,
                    ),
                    SizedBox(width: 8),
                    Text('English'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'ar',
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: langctrl.language.value == 'ar' 
                          ? (themectrl.selectedTheme.value == AppTheme.dark ? kmaincolor4dark : kmaincolor) 
                          : Colors.transparent,
                    ),
                    SizedBox(width: 8),
                    Text('العربية'),
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
                  color: themectrl.selectedTheme.value == AppTheme.dark ? Colors.white : Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Explore our services'.tr,
                style: TextStyle(
                  fontSize: 16,
                  color: themectrl.selectedTheme.value == AppTheme.dark ? Colors.white70 : Colors.black54,
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
                      icon: Icons.gavel,
                      title: 'Legal Advice'.tr,
                      color: Colors.blue.shade700,
                      onTap: () {
                        // Navigate to legal advice screen
                      },
                    ),
                    _buildGridItem(
                      icon: Icons.description_outlined,
                      title: 'Documents'.tr,
                      color: Colors.green.shade700,
                      onTap: () {
                        // Navigate to documents screen
                      },
                    ),
                    _buildGridItem(
                      icon: Icons.people_outline,
                      title: 'Consultants'.tr,
                      color: Colors.orange.shade700,
                      onTap: () {
                        // Navigate to consultants screen
                      },
                    ),
                    _buildGridItem(
                      icon: Icons.calendar_today,
                      title: 'Appointments'.tr,
                      color: Colors.purple.shade700,
                      onTap: () {
                        // Navigate to appointments screen
                      },
                    ),
                    _buildGridItem(
                      icon: Icons.article_outlined,
                      title: 'Articles'.tr,
                      color: Colors.red.shade700,
                      onTap: () {
                        // Navigate to articles screen
                      },
                    ),
                    _buildGridItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings'.tr,
                      color: Colors.grey.shade700,
                      onTap: () {
                        // Navigate to settings screen
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildGridItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Obx(() => InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: themectrl.selectedTheme.value == AppTheme.dark ? Colors.grey.shade800 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                color: color.withOpacity(0.1),
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
                color: themectrl.selectedTheme.value == AppTheme.dark ? Colors.white : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ));
  }
}
