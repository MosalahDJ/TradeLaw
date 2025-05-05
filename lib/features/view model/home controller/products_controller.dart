import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/features/model/product_list.dart';

class ProductsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController animationController;
  late Animation<double> animation;

  // Selected product for detail view
  Rx<Product?> selectedProduct = Rx<Product?>(null);
  
  // Get product categories from the model
  final List<ProductCategory> productCategories = ProductList.productCategories;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void showProductDetails(Product product) {
    selectedProduct.value = product;
    animationController.forward();
  }

  void hideProductDetails() {
    animationController.reverse().then((_) {
      selectedProduct.value = null;
    });
  }
}
