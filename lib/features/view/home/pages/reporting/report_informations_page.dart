import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:tradelaw/features/view model/home controller/reports_controller.dart';

class ReportInformationsPage extends StatelessWidget {
  final int reportId;

  const ReportInformationsPage({super.key, required this.reportId});

  @override
  Widget build(BuildContext context) {
    // Get the controller
    final ReportsController controller = Get.find<ReportsController>();
    final formKey = GlobalKey<FormState>();

    // Find the report type in the controller's list by ID
    final reportType = controller.reportTypes.firstWhere(
      (type) => type['id'] == reportId,
      orElse:
          () =>
              controller
                  .reportTypes[0], // Fallback to first report type if not found
    );

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: reportType['color'],
        title: Text(
          'Report ${reportType['title']}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          image: DecorationImage(
            image: const AssetImage(
              'lib/core/assets/images/homeimages/masjid3d.png',
            ),
            fit: BoxFit.cover,
            opacity: 0.05,
            colorFilter: ColorFilter.mode(
              reportType['color'].withOpacity(0.1),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Report type header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: reportType['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: reportType['color'].withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      reportType['icon'],
                      color: reportType['color'],
                      size: 36,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reportType['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: reportType['color'],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            reportType['description'],
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Location section
              _buildSectionHeader('Location Information', Icons.location_on),
              const SizedBox(height: 16),

              // City field
              TextFormField(
                controller: controller.cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter city name',
                  prefixIcon: Icon(Icons.location_city, color: kmaincolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kmaincolor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Town field
              TextFormField(
                controller: controller.townController,
                decoration: InputDecoration(
                  labelText: 'Town/District',
                  hintText: 'Enter town or district name',
                  prefixIcon: Icon(Icons.apartment, color: kmaincolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kmaincolor),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Village field
              TextFormField(
                controller: controller.villageController,
                decoration: InputDecoration(
                  labelText: 'Village/Neighborhood',
                  hintText: 'Enter village or neighborhood name',
                  prefixIcon: Icon(Icons.home, color: kmaincolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kmaincolor),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Market Information section
              _buildSectionHeader('Market Information', Icons.store),
              const SizedBox(height: 16),

              // Market name field
              TextFormField(
                controller: controller.marketNameController,
                decoration: InputDecoration(
                  labelText: 'Market/Store Name',
                  hintText: 'Enter the name of the market or store',
                  prefixIcon: Icon(Icons.storefront, color: kmaincolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kmaincolor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter market name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Market number field
              TextFormField(
                controller: controller.marketNumberController,
                decoration: InputDecoration(
                  labelText: 'Market/Store Number',
                  hintText: 'Enter the number or identifier of the market',
                  prefixIcon: Icon(Icons.tag, color: kmaincolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kmaincolor),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),

              // Violation Description section
              _buildSectionHeader('Violation Details', Icons.description),
              const SizedBox(height: 16),

              // Description field
              TextFormField(
                controller: controller.descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Provide details about the violation',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kmaincolor),
                  ),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide details about the violation';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              // Submit button
              SizedBox(
                height: 50,
                child: Obx(
                  () => ElevatedButton(
                    onPressed:
                        controller.isSubmitting.value
                            ? null
                            : () => controller.submitReport(formKey, context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: reportType['color'],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                    child:
                        controller.isSubmitting.value
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Submitting...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send),
                                const SizedBox(width: 8),
                                const Text(
                                  'Submit Report',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: kmaincolor),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kmaincolor,
          ),
        ),
      ],
    );
  }
}
