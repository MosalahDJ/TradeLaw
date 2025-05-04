import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';

class Reporting extends StatelessWidget {
  const Reporting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,

      title: Text(
            'reporting'.tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
    ), body: Container());
  }
}
