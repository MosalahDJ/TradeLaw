import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final bool subsidized;
  final String description;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.subsidized,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'subsidized': subsidized,
      'description': description,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      subsidized: map['subsidized'],
      description: map['description'],
      image: map['image'],
    );
  }
}

class ProductCategory {
  final String name;
  final IconData icon;
  final Color color;
  final List<Product> products;

  ProductCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'icon': icon,
      'color': color,
      'products': products.map((product) => product.toMap()).toList(),
    };
  }
}

class ProductList {
  static final List<ProductCategory> productCategories = [
    ProductCategory(
      name: 'Grains & Cereals',
      icon: Icons.grain,
      color: Color(0xFF690B22),
      products: [
        Product(
          name: 'Wheat Flour',
          price: '60 DZD/kg',
          subsidized: true,
          description: 'Government subsidized wheat flour for bread making',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
        Product(
          name: 'Semolina',
          price: '70 DZD/kg',
          subsidized: true,
          description: 'Essential for couscous and traditional Algerian dishes',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
        Product(
          name: 'Rice',
          price: '120 DZD/kg',
          subsidized: true,
          description: 'Imported rice with government price controls',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
      ],
    ),
    ProductCategory(
      name: 'Dairy Products',
      icon: Icons.egg_alt,
      color: Color(0xFF1B4D3E),
      products: [
        Product(
          name: 'Milk',
          price: '25 DZD/L',
          subsidized: true,
          description: 'Pasteurized milk with government price controls',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
        Product(
          name: 'Yogurt',
          price: '30 DZD/unit',
          subsidized: false,
          description: 'Local yogurt production with partial subsidies',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
      ],
    ),
    ProductCategory(
      name: 'Oils & Fats',
      icon: Icons.water_drop,
      color: Color(0xFFE07A5F),
      products: [
        Product(
          name: 'Vegetable Oil',
          price: '600 DZD/5L',
          subsidized: true,
          description: 'Cooking oil with strict price controls',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
        Product(
          name: 'Olive Oil',
          price: '900 DZD/L',
          subsidized: false,
          description: 'Premium Algerian olive oil with partial price support',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
      ],
    ),
    ProductCategory(
      name: 'Sugar & Sweeteners',
      icon: Icons.cake,
      color: Color(0xFF776B3F),
      products: [
        Product(
          name: 'White Sugar',
          price: '90 DZD/kg',
          subsidized: true,
          description: 'Refined sugar with government price controls',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
      ],
    ),
    ProductCategory(
      name: 'Legumes',
      icon: Icons.spa,
      color: Color(0xFF3C7F6B),
      products: [
        Product(
          name: 'Lentils',
          price: '180 DZD/kg',
          subsidized: true,
          description: 'Imported lentils with price controls',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
        Product(
          name: 'Chickpeas',
          price: '200 DZD/kg',
          subsidized: true,
          description: 'Essential legume for Algerian cuisine',
          image: 'lib/core/assets/images/homeimages/grocery.png',
        ),
      ],
    ),
  ];
}
