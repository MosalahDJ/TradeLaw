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
        title: Text(
          'law_info'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context, 'algerian_trade_laws'.tr),
          const SizedBox(height: 16),
          _buildLawSection(
            title: 'consumer_protection_law'.tr,
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
          const SizedBox(height: 12),
          _buildLawSection(
            title: 'price_regulation_law'.tr,
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
          const SizedBox(height: 12),
          _buildLawSection(
            title: 'ecommerce_law'.tr,
            content: [
              _buildArticle(
                'article_1'.tr,
                'ecommerce_article_1_desc'.tr,
              ),
              _buildArticle(
                'article_6'.tr,
                'ecommerce_article_6_desc'.tr,
              ),
              _buildArticle(
                'article_10'.tr,
                'ecommerce_article_10_desc'.tr,
              ),
              _buildArticle(
                'article_12'.tr,
                'ecommerce_article_12_desc'.tr,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildLawSection(
            title: 'intellectual_property_protection'.tr,
            content: [
              _buildArticle(
                'article_1_ipr'.tr,
                'ipr_article_1_desc'.tr,
              ),
              _buildArticle(
                'article_4'.tr,
                'ipr_article_4_desc'.tr,
              ),
              _buildArticle(
                'article_7'.tr,
                'ipr_article_7_desc'.tr,
              ),
              _buildArticle(
                'article_11'.tr,
                'ipr_article_11_desc'.tr,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildLawSection(
            title: 'import_regulations'.tr,
            content: [
              _buildArticle(
                'article_1_import'.tr,
                'import_article_1_desc'.tr,
              ),
              _buildArticle(
                'article_3'.tr,
                'import_article_3_desc'.tr,
              ),
              _buildArticle(
                'article_5'.tr,
                'import_article_5_desc'.tr,
              ),
              _buildArticle(
                'article_8'.tr,
                'import_article_8_desc'.tr,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: kmaincolor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLawSection({
    required String title,
    required List<Widget> content,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: kmaincolor),
        ),
        children: [
          Padding(
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
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articleNumber,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 14)),
          const Divider(),
        ],
      ),
    );
  }
}
