import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportTracking extends StatelessWidget {
  const ReportTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'report_tracking'.tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
      ),
      
      body: Container());
  }
}
