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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'lib/core/assets/images/app_logo/pnglogo1.png',
            ),
            fit: BoxFit.fitWidth,
            opacity: 0.05,
            colorFilter: ColorFilter.mode(
              kmaincolor.withOpacity(0.1),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHeader(context, 'Algerian Trade Laws'),
            const SizedBox(height: 16),
            _buildLawSection(
              title: 'Consumer Protection Law 09-03',
              content: [
                _buildArticle(
                  'Article 1',
                  'Establishes general rules for consumer protection and fraud suppression in goods and services.',
                ),
                _buildArticle(
                  'Article 2',
                  'Defines a consumer as any natural or legal person who acquires or uses goods or services for non-professional purposes.',
                ),
                _buildArticle(
                  'Article 3',
                  'Requires that all products must be safe for consumer health and safety under normal or reasonably foreseeable conditions of use.',
                ),
                _buildArticle(
                  'Article 17',
                  'Prohibits the sale of counterfeit goods and services that violate commercial norms and rules of fairness.',
                ),
                _buildArticle(
                  'Article 18',
                  'Mandates that products must conform to the standards defined in the Codex Alimentarius for food products.',
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildLawSection(
              title: 'Price Regulation Law 10-06',
              content: [
                _buildArticle(
                  'Article 1',
                  'Allows the government to set price controls on consumer goods and services to curb inflation and protect purchasing power.',
                ),
                _buildArticle(
                  'Article 2',
                  'Establishes mechanisms for monitoring and regulating market prices of essential goods.',
                ),
                _buildArticle(
                  'Article 5',
                  'Provides for subsidies on several consumer items including sugar, milk, water, petrol, diesel, and flour.',
                ),
                _buildArticle(
                  'Article 8',
                  'Prohibits unjustified price increases and speculative practices that affect consumer purchasing power.',
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildLawSection(
              title: 'E-Commerce Law 18-05',
              content: [
                _buildArticle(
                  'Article 1',
                  'Organizes e-commerce activity with a focus on protecting consumers in electronic transactions.',
                ),
                _buildArticle(
                  'Article 6',
                  'Requires e-suppliers to send consumers an electronic copy of the contract and invoice in accordance with Algerian law.',
                ),
                _buildArticle(
                  'Article 10',
                  'Mandates obtaining consumer consent before collecting personal data and guaranteeing system security and data confidentiality.',
                ),
                _buildArticle(
                  'Article 12',
                  'Regulates electronic advertising and prohibits commercial prospection by email without prior consent.',
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildLawSection(
              title: 'Intellectual Property Protection',
              content: [
                _buildArticle(
                  'Article 1 (IPR Framework)',
                  'Establishes the legal framework for intellectual property rights protection in Algeria.',
                ),
                _buildArticle(
                  'Article 4',
                  'Requires IP rights holders to register and seek enforcement of their rights under local laws, as foreign registrations are not automatically recognized.',
                ),
                _buildArticle(
                  'Article 7',
                  'Prohibits counterfeiting of products, especially in cosmetics, clothing, shoes, electrical appliances, and consumer and food products.',
                ),
                _buildArticle(
                  'Article 11',
                  'Provides for coordination between customs authorities and law enforcement to combat counterfeit merchandise.',
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildLawSection(
              title: 'Import Regulations',
              content: [
                _buildArticle(
                  'Article 1 (Import Control)',
                  'Bans the import of firearms, explosives, narcotics, certain pharmaceutical products, used equipment, GMO seeds, and pork products.',
                ),
                _buildArticle(
                  'Article 3',
                  'Requires that imported food products must have at least 80% of their remaining shelf life upon arrival in Algeria.',
                ),
                _buildArticle(
                  'Article 5',
                  'Establishes temporary duties between 30% and 200% applicable to certain import operations.',
                ),
                _buildArticle(
                  'Article 8',
                  'Implements phyto-sanitary and sanitary control regulations for imported products.',
                ),
              ],
            ),
          ],
        ),
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
