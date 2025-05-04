import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpandfedback extends StatelessWidget {
  const Helpandfedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text(
            'help&feedback'.tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
      ),
      body: Container());
  }
}
