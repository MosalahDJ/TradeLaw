import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Selected product for detail view
  Map<String, dynamic>? selectedProduct;

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
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showProductDetails(Map<String, dynamic> product) {
    setState(() {
      selectedProduct = product;
    });
    _controller.forward();
  }

  void _hideProductDetails() {
    _controller.reverse().then((_) {
      setState(() {
        selectedProduct = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'products'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Main content - Categories and Products
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: productCategories.length,
              itemBuilder: (context, index) {
                final category = productCategories[index];
                return _buildCategoryCard(category);
              },
            ),
          ),

          // Product Detail Sliding Panel
          if (selectedProduct != null)
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height:
                      MediaQuery.of(context).size.height *
                      0.7 *
                      _animation.value,
                  child: GestureDetector(
                    onVerticalDragEnd: (details) {
                      if (details.primaryVelocity! > 300) {
                        _hideProductDetails();
                      }
                    },
                    child: child!,
                  ),
                );
              },
              child: _buildProductDetailPanel(),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: category['color'],
          child: Icon(category['icon'], color: Colors.white),
        ),
        title: Text(
          category['name'],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: category['products'].length,
            itemBuilder: (context, index) {
              final product = category['products'][index];
              return _buildProductCard(product);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () => _showProductDetails(product),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(product['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child:
                      product['subsidized']
                          ? Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Subsidized',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          )
                          : const SizedBox(),
                ),
              ),
            ),
            // Product Info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['price'],
                    style: TextStyle(
                      color:
                          product['subsidized'] ? Colors.green : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetailPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Close button
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: _hideProductDetails,
            ),
          ),
          // Product image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(selectedProduct!['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Product details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedProduct!['name'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selectedProduct!['subsidized']
                                ? Colors.green
                                : Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        selectedProduct!['subsidized']
                            ? 'Subsidized'
                            : 'Partial Support',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  selectedProduct!['price'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color:
                        selectedProduct!['subsidized']
                            ? Colors.green.shade700
                            : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  selectedProduct!['description'],
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Government Support Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    selectedProduct!['subsidized']
                        ? 'This product is fully subsidized by the Algerian government to ensure affordability and accessibility for all citizens.'
                        : 'This product receives partial price support from the government to stabilize market prices.',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
