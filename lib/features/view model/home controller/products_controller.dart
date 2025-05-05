import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController animationController;
  late Animation<double> animation;

  // Selected product for detail view
  Rx<Map<String, dynamic>?> selectedProduct = Rx<Map<String, dynamic>?>(null);

  // Product categories with their respective products
  final List<Map<String, dynamic>> productCategories = [
    {
      'name': 'Grains & Cereals',
      'icon': Icons.grain,
      'color': Color(0xFF690B22),
      'products': [
        {
          'name': 'Wheat Flour',
          'price': '60 DZD/kg',
          'subsidized': true,
          'description': 'Government subsidized wheat flour for bread making',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
        {
          'name': 'Semolina',
          'price': '70 DZD/kg',
          'subsidized': true,
          'description':
              'Essential for couscous and traditional Algerian dishes',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
        {
          'name': 'Rice',
          'price': '120 DZD/kg',
          'subsidized': true,
          'description': 'Imported rice with government price controls',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
      ],
    },
    {
      'name': 'Dairy Products',
      'icon': Icons.egg_alt,
      'color': Color(0xFF1B4D3E),
      'products': [
        {
          'name': 'Milk',
          'price': '25 DZD/L',
          'subsidized': true,
          'description': 'Pasteurized milk with government price controls',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
        {
          'name': 'Yogurt',
          'price': '30 DZD/unit',
          'subsidized': false,
          'description': 'Local yogurt production with partial subsidies',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
      ],
    },
    {
      'name': 'Oils & Fats',
      'icon': Icons.water_drop,
      'color': Color(0xFFE07A5F),
      'products': [
        {
          'name': 'Vegetable Oil',
          'price': '600 DZD/5L',
          'subsidized': true,
          'description': 'Cooking oil with strict price controls',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
        {
          'name': 'Olive Oil',
          'price': '900 DZD/L',
          'subsidized': false,
          'description':
              'Premium Algerian olive oil with partial price support',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
      ],
    },
    {
      'name': 'Sugar & Sweeteners',
      'icon': Icons.cake,
      'color': Color(0xFF776B3F),
      'products': [
        {
          'name': 'White Sugar',
          'price': '90 DZD/kg',
          'subsidized': true,
          'description': 'Refined sugar with government price controls',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
      ],
    },
    {
      'name': 'Legumes',
      'icon': Icons.spa,
      'color': Color(0xFF3C7F6B),
      'products': [
        {
          'name': 'Lentils',
          'price': '180 DZD/kg',
          'subsidized': true,
          'description': 'Imported lentils with price controls',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
        {
          'name': 'Chickpeas',
          'price': '200 DZD/kg',
          'subsidized': true,
          'description': 'Essential legume for Algerian cuisine',
          'image': 'lib/core/assets/images/homeimages/masjid3d.png',
        },
      ],
    },
  ];

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

  void showProductDetails(Map<String, dynamic> product) {
    selectedProduct.value = product;
    animationController.forward();
  }

  void hideProductDetails() {
    animationController.reverse().then((_) {
      selectedProduct.value = null;
    });
  }
}
