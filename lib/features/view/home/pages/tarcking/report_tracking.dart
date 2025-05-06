import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting

class ReportTracking extends StatelessWidget {
  const ReportTracking({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample report data - in a real app, this would come from a controller or API
    final List<Map<String, dynamic>> reports = [
      {
        'id': 1,
        'title': 'Price Manipulation Report',
        'description': 'Report about a store increasing prices artificially',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'status': 'Under Review',
      },
      {
        'id': 2,
        'title': 'Expired Products',
        'description': 'Found expired products being sold at the supermarket',
        'timestamp': DateTime.now().subtract(const Duration(days: 1)),
        'status': 'Investigating',
      },
      {
        'id': 3,
        'title': 'Illegal Products',
        'description': 'Report of counterfeit products being sold',
        'timestamp': DateTime.now().subtract(const Duration(days: 3)),
        'status': 'Resolved',
      },
      {
        'id': 4,
        'title': 'Hygiene Violation',
        'description': 'Restaurant with poor sanitation conditions',
        'timestamp': DateTime.now().subtract(const Duration(days: 5)),
        'status': 'Closed',
      },
    ];

    // Sort reports from newest to oldest
    reports.sort(
      (a, b) =>
          (b['timestamp'] as DateTime).compareTo(a['timestamp'] as DateTime),
    );

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'report_tracking'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
          reports.isEmpty
              ? Center(
                child: Text(
                  'no_reports'.tr,
                  style: const TextStyle(fontSize: 18),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final report = reports[index];
                  final DateTime timestamp = report['timestamp'] as DateTime;
                  final String formattedDate = DateFormat(
                    'MMM dd, yyyy - HH:mm',
                  ).format(timestamp);

                  // Determine status color
                  Color statusColor;
                  switch (report['status']) {
                    case 'Under Review':
                      statusColor = Colors.orange;
                      break;
                    case 'Investigating':
                      statusColor = Colors.blue;
                      break;
                    case 'Resolved':
                      statusColor = Colors.green;
                      break;
                    case 'Closed':
                      statusColor = Colors.red;
                      break;
                    default:
                      statusColor = Colors.grey;
                  }

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  report['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: statusColor),
                                ),
                                child: Text(
                                  report['status'],
                                  style: TextStyle(
                                    color: statusColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            report['description'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigate to report details
                                  // Get.toNamed('/report_details', arguments: report['id']);
                                },
                                child: Text(
                                  'view_details'.tr,
                                  style: TextStyle(color: kmaincolor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
