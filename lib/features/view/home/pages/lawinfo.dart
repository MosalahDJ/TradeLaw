import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lawinfo extends StatelessWidget {
  const Lawinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'law_info'.tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
      ),
      
      body: Container());
  }
}
