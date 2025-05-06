import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting

class TrackingDetail extends StatelessWidget {
  TrackingDetail({super.key,required int reportId});
    final reportId = Get.arguments as int;


  @override
  Widget build(BuildContext context) {
    // Get the report ID from arguments
    
    // Sample report data - in a real app, this would come from a controller or API
    final Map<String, dynamic> report = {
      'id': reportId,
      'title': 'Price Manipulation Report',
      'description': 'Report about a store increasing prices artificially',
      'timestamp': DateTime.now().subtract(const Duration(days: 5)),
      'status': 'Under Investigation',
      'location': 'Downtown Market, Main Street',
      'reporter': 'Anonymous',
      'tracking': [
        {
          'step': 1,
          'title': 'Report Submitted',
          'description': 'Your report has been successfully submitted to our system.',
          'timestamp': DateTime.now().subtract(const Duration(days: 5)),
          'completed': true,
          'icon': Icons.assignment_turned_in,
        },
        {
          'step': 2,
          'title': 'Initial Review',
          'description': 'Our team has reviewed your report and determined it requires further investigation.',
          'timestamp': DateTime.now().subtract(const Duration(days: 4)),
          'completed': true,
          'icon': Icons.find_in_page,
        },
        {
          'step': 3,
          'title': 'Under Investigation',
          'description': 'Field agents have been assigned to investigate the reported issue.',
          'timestamp': DateTime.now().subtract(const Duration(days: 2)),
          'completed': true,
          'icon': Icons.search,
        },
        {
          'step': 4,
          'title': 'Evidence Collection',
          'description': 'Our team is collecting evidence and documenting findings.',
          'timestamp': DateTime.now().subtract(const Duration(days: 1)),
          'completed': true,
          'icon': Icons.photo_camera,
        },
        {
          'step': 5,
          'title': 'Legal Assessment',
          'description': 'Legal team is reviewing the evidence and determining appropriate actions.',
          'timestamp': DateTime.now(),
          'completed': false,
          'icon': Icons.gavel,
        },
        {
          'step': 6,
          'title': 'Action Taken',
          'description': 'Enforcement actions will be taken based on investigation findings.',
          'timestamp': null,
          'completed': false,
          'icon': Icons.policy,
        },
        {
          'step': 7,
          'title': 'Case Closed',
          'description': 'The case has been resolved and appropriate measures have been implemented.',
          'timestamp': null,
          'completed': false,
          'icon': Icons.task_alt,
        },
      ],
    };

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'tracking_detail'.tr,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Report Summary Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kmaincolor.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.assignment, color: kmaincolor),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                report['title'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'ID: #${report['id'].toString().padLeft(6, '0')}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _getStatusColor(report['status']).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _getStatusColor(report['status']),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            report['status'],
                            style: TextStyle(
                              color: _getStatusColor(report['status']),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.description, 'description'.tr, report['description']),
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.location_on, 'location'.tr, report['location']),
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      Icons.calendar_today,
                      'submitted_on'.tr,
                      DateFormat('MMMM dd, yyyy - HH:mm').format(report['timestamp']),
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.person, 'reported_by'.tr, report['reporter']),
                  ],
                ),
              ),
            ),

            // Tracking Timeline Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'tracking_progress'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Tracking Timeline
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: _buildTrackingTimeline(report['tracking']),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build info rows
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to build the tracking timeline
  List<Widget> _buildTrackingTimeline(List<dynamic> trackingSteps) {
    final List<Widget> timelineItems = [];

    for (int i = 0; i < trackingSteps.length; i++) {
      final step = trackingSteps[i];
      final bool isLast = i == trackingSteps.length - 1;

      timelineItems.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator and line
            Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: step['completed'] ? kmaincolor : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    step['icon'],
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 50,
                    color: step['completed'] ? kmaincolor : Colors.grey[300],
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            // Step content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        step['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: step['completed'] ? Colors.black : Colors.grey[600],
                        ),
                      ),
                      if (step['timestamp'] != null)
                        Text(
                          DateFormat('MMM dd, yyyy').format(step['timestamp']),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    step['description'],
                    style: TextStyle(
                      fontSize: 14,
                      color: step['completed'] ? Colors.black87 : Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return timelineItems;
  }

  // Helper method to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Submitted':
        return Colors.blue;
      case 'Under Review':
        return Colors.orange;
      case 'Under Investigation':
        return Colors.purple;
      case 'Resolved':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
