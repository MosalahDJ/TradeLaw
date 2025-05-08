import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';

class Lawinfo extends StatelessWidget {
  const Lawinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        elevation: 2,
        title: Text(
          'law_info'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context, 'algerian_trade_laws'.tr),
          const SizedBox(height: 16),
          _buildLawSection(
            title: 'consumer_protection_law'.tr,
            color: Colors.red.shade700,
            icon: Icons.security,
            content: [
              _buildArticle(
                'article_1'.tr,
                'consumer_protection_article_1_desc'.tr,
              ),
              _buildArticle(
                'article_2'.tr,
                'consumer_protection_article_2_desc'.tr,
              ),
              _buildArticle(
                'article_3'.tr,
                'consumer_protection_article_3_desc'.tr,
              ),
              _buildArticle(
                'article_17'.tr,
                'consumer_protection_article_17_desc'.tr,
              ),
              _buildArticle(
                'article_18'.tr,
                'consumer_protection_article_18_desc'.tr,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildLawSection(
            title: 'price_regulation_law'.tr,
            color: Colors.blue.shade700,
            icon: Icons.attach_money,
            content: [
              _buildArticle(
                'article_1'.tr,
                'price_regulation_article_1_desc'.tr,
              ),
              _buildArticle(
                'article_2'.tr,
                'price_regulation_article_2_desc'.tr,
              ),
              _buildArticle(
                'article_5'.tr,
                'price_regulation_article_5_desc'.tr,
              ),
              _buildArticle(
                'article_8'.tr,
                'price_regulation_article_8_desc'.tr,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildLawSection(
            title: 'ecommerce_law'.tr,
            color: Colors.green.shade700,
            icon: Icons.shopping_cart,
            content: [
              _buildArticle('article_1'.tr, 'ecommerce_article_1_desc'.tr),
              _buildArticle('article_6'.tr, 'ecommerce_article_6_desc'.tr),
              _buildArticle('article_10'.tr, 'ecommerce_article_10_desc'.tr),
              _buildArticle('article_12'.tr, 'ecommerce_article_12_desc'.tr),
            ],
          ),
          const SizedBox(height: 16),
          _buildLawSection(
            title: 'intellectual_property_protection'.tr,
            color: Colors.purple.shade700,
            icon: Icons.copyright,
            content: [
              _buildArticle('article_1_ipr'.tr, 'ipr_article_1_desc'.tr),
              _buildArticle('article_4'.tr, 'ipr_article_4_desc'.tr),
              _buildArticle('article_7'.tr, 'ipr_article_7_desc'.tr),
              _buildArticle('article_11'.tr, 'ipr_article_11_desc'.tr),
            ],
          ),
          const SizedBox(height: 16),
          _buildLawSection(
            title: 'import_regulations'.tr,
            color: Colors.orange.shade700,
            icon: Icons.inventory,
            content: [
              _buildArticle('article_1_import'.tr, 'import_article_1_desc'.tr),
              _buildArticle('article_3'.tr, 'import_article_3_desc'.tr),
              _buildArticle('article_5'.tr, 'import_article_5_desc'.tr),
              _buildArticle('article_8'.tr, 'import_article_8_desc'.tr),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: kmaincolor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kmaincolor.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.balance, color: kmaincolor, size: 28),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kmaincolor,
              fontFamily: 'Cairo',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLawSection({
    required String title,
    required List<Widget> content,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 16,
          ),
        ),
        childrenPadding: EdgeInsets.zero,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticle(String articleNumber, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: kmaincolor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kmaincolor.withOpacity(0.3), width: 1),
            ),
            child: Text(
              articleNumber,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kmaincolor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(fontSize: 14, height: 1.5)),
          const Divider(height: 24),
        ],
      ),
    );
  }
}
