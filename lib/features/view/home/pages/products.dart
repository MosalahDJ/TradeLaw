import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'products'.tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
      ),
      
      body: Container());
  }
}
