import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';

class Reporting extends StatelessWidget {
  const Reporting({super.key});

  @override
  Widget build(BuildContext context) {
    // List of report types with their icons and descriptions
    final List<Map<String, dynamic>> reportTypes = [
      {
        'title': 'Price Manipulation',
        'icon': Icons.attach_money,
        'color': kmaincolor,
        'description':
            'Report businesses that artificially increase prices or engage in unfair pricing practices.',
      },
      {
        'title': 'Monopoly & Speculation',
        'icon': Icons.business_center,
        'color': kmaincolor4,
        'description':
            'Report businesses hoarding products to create artificial scarcity or monopolistic practices.',
      },
      {
        'title': 'Expired Products',
        'icon': Icons.no_food,
        'color': kmaincolor2,
        'description':
            'Report businesses selling products past their expiration date or with altered expiry information.',
      },
      {
        'title': 'Illegal Products',
        'icon': Icons.warning_amber,
        'color': Colors.red.shade800,
        'description':
            'Report the sale of prohibited, counterfeit, or unlicensed products.',
      },
      {
        'title': 'Hygiene Violations',
        'icon': Icons.cleaning_services,
        'color': Colors.teal.shade700,
        'description':
            'Report businesses with poor sanitation, unhygienic food handling, or unsanitary conditions.',
      },
      {
        'title': 'Other Violations',
        'icon': Icons.report_problem,
        'color': Colors.amber.shade800,
        'description':
            'Report other trade law violations not covered by the categories above.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'reporting'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
              kmaincolor.withOpacity(0.1),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: reportTypes.length,
          itemBuilder: (context, index) {
            final reportType = reportTypes[index];
            return _buildReportCard(reportType, context);
          },
        ),
      ),
    );
  }

  Widget _buildReportCard(
    Map<String, dynamic> reportType,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Show a dialog or navigate to a form for this report type
          _showReportDialog(reportType, context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon with colored background
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: reportType['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  reportType['icon'],
                  color: reportType['color'],
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reportType['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
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
              // Arrow icon
              Icon(Icons.arrow_forward_ios, color: kmaincolor, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showReportDialog(
    Map<String, dynamic> reportType,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(reportType['icon'], color: reportType['color']),
              const SizedBox(width: 8),
              Text('Report ${reportType['title']}'),
            ],
          ),
          content: const Text(
            'This feature will allow you to submit a detailed report about this violation. Implementation coming soon.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close', style: TextStyle(color: kmaincolor)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kmaincolor,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Submit Report'),
            ),
          ],
        );
      },
    );
  }
}
