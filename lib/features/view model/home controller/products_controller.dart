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
          'image':
              'https://images.unsplash.com/photo-1603046891726-36bfd957e0bf',
        },
        {
          'name': 'Semolina',
          'price': '70 DZD/kg',
          'subsidized': true,
          'description':
              'Essential for couscous and traditional Algerian dishes',
          'image':
              'https://images.unsplash.com/photo-1586444248879-bc604bc77f90',
        },
        {
          'name': 'Rice',
          'price': '120 DZD/kg',
          'subsidized': true,
          'description': 'Imported rice with government price controls',
          'image':
              'https://images.unsplash.com/photo-1586201375761-83865001e8ac',
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
          'image': 'https://images.unsplash.com/photo-1563636619-e9143da7973b',
        },
        {
          'name': 'Yogurt',
          'price': '30 DZD/unit',
          'subsidized': false,
          'description': 'Local yogurt production with partial subsidies',
          'image':
              'https://images.unsplash.com/photo-1571212515416-fef01fc43637',
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
          'image':
              'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5',
        },
        {
          'name': 'Olive Oil',
          'price': '900 DZD/L',
          'subsidized': false,
          'description':
              'Premium Algerian olive oil with partial price support',
          'image':
              'https://images.unsplash.com/photo-1474979087453-7a86214f001a',
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
          'image':
              'https://images.unsplash.com/photo-1581000197348-5a65b9ab8a32',
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
          'image':
              'https://images.unsplash.com/photo-1615485290382-441e4d049cb5',
        },
        {
          'name': 'Chickpeas',
          'price': '200 DZD/kg',
          'subsidized': true,
          'description': 'Essential legume for Algerian cuisine',
          'image':
              'https://images.unsplash.com/photo-1515543904379-3d757afe72e1',
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
