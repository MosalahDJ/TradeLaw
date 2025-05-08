import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';

class ReportsController extends GetxController {
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
      isSubmitting.value = true;

      try {
        // Here you would typically make an API call to submit the report
        // For now, we'll simulate a delay
        await Future.delayed(const Duration(seconds: 2));

        // Show success dialog
        // ignore: use_build_context_synchronously
        showSuccessDialog(context);
      } catch (e) {
        // Handle error
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
}

// Add these translation methods to the ReportsController class
Map<String, dynamic> getTranslatedReportType(Map<String, dynamic> reportType) {
  // Create a copy of the report type to avoid modifying the original
  final translatedType = Map<String, dynamic>.from(reportType);

  // The title and description will be translated in the UI using .tr
  return translatedType;
}
