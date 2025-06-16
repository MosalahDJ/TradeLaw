import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradelaw/core/Utils/constants.dart';

class ReportsController extends GetxController {
  // Get Supabase client instance
  final _supabase = Supabase.instance.client;
  
  // Report types data
  final List<Map<String, dynamic>> reportTypes = [
    {
      'id': 1,
      'title': 'Price Manipulation'.tr,
      'icon': Icons.attach_money,
      'color': kmaincolor,
      'description': 'd1'.tr,
    },
    {
      'id': 2,
      'title': 'Monopoly & Speculation'.tr,
      'icon': Icons.business_center,
      'color': kmaincolor4,
      'description': 'd2'.tr,
    },
    {
      'id': 3,
      'title': 'Expired Products'.tr,
      'icon': Icons.no_food,
      'color': kmaincolor2,
      'description': 'd3'.tr,
    },
    {
      'id': 4,
      'title': 'Illegal Products'.tr,
      'icon': Icons.warning_amber,
      'color': Colors.red.shade800,
      'description': 'd4'.tr,
    },
    {
      'id': 5,
      'title': 'Hygiene Violations'.tr,
      'icon': Icons.cleaning_services,
      'color': Colors.teal.shade700,
      'description': 'd5'.tr,
    },
    {
      'id': 6,
      'title': 'Other Violations'.tr,
      'icon': Icons.report_problem,
      'color': Colors.amber.shade800,
      'description': 'd6'.tr,
    },
  ];

  // Form controllers
  final TextEditingController cityController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController marketNameController = TextEditingController();
  final TextEditingController marketNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Form state
  final RxBool isSubmitting = false.obs;

  // Selected report type
  Rx<Map<String, dynamic>?> selectedReportType = Rx<Map<String, dynamic>?>(
    null,
  );

  @override
  void onClose() {
    // Dispose controllers when the controller is closed
    cityController.dispose();
    townController.dispose();
    villageController.dispose();
    marketNameController.dispose();
    marketNumberController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // Navigate to report details page
  void navigateToReportDetails(
    int reportid,
    Map<String, dynamic> reportType,
    BuildContext context,
  ) {
    selectedReportType.value = reportType;
    Navigator.pushNamed(context, '/report_information', arguments: reportid);
    // OR use Get navigation instead:
    // Get.toNamed('/report_information', arguments: reportType);
  }

  // Submit report logic
  Future<void> submitReport(
    GlobalKey<FormState> formKey,
    BuildContext context,
  ) async {
    if (formKey.currentState!.validate()) {
      // Check if a report type is selected
      if (selectedReportType.value == null) {
        Get.snackbar(
          'Error',
          'Please select a report type',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      isSubmitting.value = true;

      try {
        // Get current user
        final user = _supabase.auth.currentUser;
        if (user == null) {
          throw Exception('User not authenticated');
        }

        // Prepare report data
        final reportData = {
          'user_id': user.id,
          'report_type_id': selectedReportType.value!['id'],
          'report_type_title': selectedReportType.value!['title'],
          'city': cityController.text.trim(),
          'town': townController.text.trim().isEmpty ? null : townController.text.trim(),
          'village': villageController.text.trim().isEmpty ? null : villageController.text.trim(),
          'market_name': marketNameController.text.trim(),
          'market_number': marketNumberController.text.trim().isEmpty ? null : marketNumberController.text.trim(),
          'description': descriptionController.text.trim(),
          'status': 'pending',
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        };

        // Insert report into Supabase
        final response = await _supabase
            .from('reports')
            .insert(reportData)
            .select()
            .single();

        // Show success dialog
        // ignore: use_build_context_synchronously
        showSuccessDialog(context);

        // Optional: Show success message with report ID
        Get.snackbar(
          'Success',
          'Report submitted successfully! Report ID: ${response['id']}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );

      } on PostgrestException catch (e) {
        // Handle Supabase-specific errors
        Get.snackbar(
          'Database Error',
          'Failed to submit report: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
      } on AuthException catch (e) {
        // Handle authentication errors
        Get.snackbar(
          'Authentication Error',
          'Please log in to submit a report: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } catch (e) {
        // Handle other errors
        Get.snackbar(
          'Error',
          'Failed to submit report: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isSubmitting.value = false;
      }
    }
  }

  // Show success dialog
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 8),
              const Text('Report Submitted'),
            ],
          ),
          content: const Text(
            'Thank you for your report. The authorities will review your submission and take appropriate action.',
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kmaincolor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                cityController.clear();
                townController.clear();
                villageController.clear();
                marketNameController.clear();
                marketNumberController.clear();
                descriptionController.clear();
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to reports list
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Reset form fields
  void resetForm() {
    cityController.clear();
    townController.clear();
    villageController.clear();
    marketNameController.clear();
    marketNumberController.clear();
    descriptionController.clear();
  }
  
// Add these translation methods to the ReportsController class
Map<String, dynamic> getTranslatedReportType(Map<String, dynamic> reportType) {
  // Create a copy of the report type to avoid modifying the original
  final translatedType = Map<String, dynamic>.from(reportType);

  // The title and description will be translated in the UI using .tr
  return translatedType;
}

  // Observable list for user reports
  final RxList<Map<String, dynamic>> userReports = <Map<String, dynamic>>[].obs;
  final RxBool isLoadingReports = false.obs;

  // Fetch user's reports
  Future<void> fetchUserReports() async {
    try {
      isLoadingReports.value = true;
      
      final user = _supabase.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final response = await _supabase
          .from('reports')
          .select('*')
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      userReports.value = List<Map<String, dynamic>>.from(response);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch reports: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoadingReports.value = false;
    }
  }

}
