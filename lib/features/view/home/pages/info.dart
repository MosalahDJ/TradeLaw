import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
            'info'.tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
    ), body: Container());
  }
}
