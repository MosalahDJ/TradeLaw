import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelaw/core/Utils/constants.dart';

class Helpandfedback extends StatefulWidget {
  const Helpandfedback({super.key});

  @override
  State<Helpandfedback> createState() => _HelpandfedbackState();
}

class _HelpandfedbackState extends State<Helpandfedback>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'help&feedback'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(text: 'FAQs'.tr),
            Tab(text: 'Contact'.tr),
            Tab(text: 'Feedback'.tr),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildFAQsTab(), _buildContactTab(), _buildFeedbackTab()],
      ),
    );
  }

  Widget _buildFAQsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildFAQItem(
          'What is TradeLaw app?',
          'TradeLaw is an application designed to help users understand and navigate Algerian trade laws, regulations, and procedures. It provides information about consumer rights, business regulations, and legal resources.',
        ),
        _buildFAQItem(
          'How do I report a trade law violation?',
          'You can report violations through the "Report" section in the app. Fill out the required information including the type of violation, location, and any evidence you may have. Your report will be submitted to the relevant authorities.',
        ),
        _buildFAQItem(
          'How can I track my submitted reports?',
          'Go to the "My Reports" section where you can view all your submitted reports and their current status. Each report has a unique tracking number that you can use to follow up on its progress.',
        ),
        _buildFAQItem(
          'What types of trade violations can I report?',
          'You can report various violations including price manipulation, counterfeit products, misleading advertising, consumer rights violations, and unfair business practices.',
        ),
        _buildFAQItem(
          'Is my personal information secure?',
          'Yes, we take data privacy seriously. Your personal information is protected according to Algerian Law No. 18-07 on personal data protection. We only share necessary information with relevant authorities for investigation purposes.',
        ),
        _buildFAQItem(
          'How do I update my account information?',
          'Go to the "Profile" section in the app where you can edit your personal information, change your password, and manage your notification preferences.',
        ),
        _buildFAQItem(
          'Can I use the app offline?',
          'Some features of the app are available offline, such as viewing previously loaded laws and regulations. However, submitting reports and accessing real-time updates requires an internet connection.',
        ),
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold, color: kmaincolor),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(answer, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'contact_information'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kmaincolor,
                  ),
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  Icons.email,
                  'email'.tr,
                  'support@tradelaw.dz',
                ),
                const Divider(),
                _buildContactItem(Icons.phone, 'phone'.tr, '+213 123 456 789'),
                const Divider(),
                _buildContactItem(
                  Icons.location_on,
                  'address'.tr,
                  'Ministry of Trade, Algiers, Algeria',
                ),
                const Divider(),
                _buildContactItem(
                  Icons.access_time,
                  'working_hours'.tr,
                  'Sunday - Thursday: 8:00 AM - 4:00 PM',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'emergency_contacts'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kmaincolor,
                  ),
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  Icons.emergency,
                  'consumer_protection_hotline'.tr,
                  '1020',
                ),
                const Divider(),
                _buildContactItem(
                  Icons.security,
                  'trade_fraud_reporting'.tr,
                  '1055',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'social_media'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kmaincolor,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSocialMediaItem(
                  Icons.facebook,
                  'facebook'.tr,
                  '@TradeLawAlgeria',
                ),
                const Divider(),
                _buildSocialMediaItem(
                  Icons.telegram,
                  'telegram'.tr,
                  '@TradeLawAlgeria',
                ),
                const Divider(),
                _buildSocialMediaItem(
                  Icons.web,
                  'website'.tr,
                  'www.tradelaw.dz',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'developer_social'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kmaincolor,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSocialMediaItem(
                  Icons.facebook,
                  'facebook'.tr,
                  'Djehel Mohamed Salah',
                ),
                const Divider(),
                _buildSocialMediaItem(
                  Icons.telegram,
                  'telegram'.tr,
                  'https://t.me/Mohamed_Salah_Djehel',
                ),
                const Divider(),
                _buildSocialMediaItem(
                  Icons.camera_alt,
                  'instagram'.tr,
                  'moh.medsalah',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: kmaincolor),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaItem(IconData icon, String platform, String handle) {
    return InkWell(
      onTap: () {
        // TODO: Implement social media link opening
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: kmaincolor),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  handle,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: kmaincolor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kmaincolor, width: 2),
        ),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildFeedbackTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We Value Your Feedback'.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kmaincolor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please share your thoughts, suggestions, or report any issues you encountered while using our app.'
                  .tr,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _nameController,
              label: 'Name'.tr,
              hint: 'Enter your name'.tr,
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _emailController,
              label: 'Email'.tr,
              hint: 'Enter your email'.tr,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email'.tr;
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _messageController,
              label: 'Message'.tr,
              hint: 'Enter your message'.tr,
              icon: Icons.message,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message'.tr;
                }
                if (value.length < 10) {
                  return 'Message should be at least 10 characters'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kmaincolor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Submit Feedback'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Feedback Type'.tr,
        prefixIcon: Icon(Icons.category, color: kmaincolor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kmaincolor, width: 2),
        ),
      ),
      items: [
        DropdownMenuItem(value: 'suggestion', child: Text('Suggestion'.tr)),
        DropdownMenuItem(value: 'bug', child: Text('Bug Report'.tr)),
        DropdownMenuItem(value: 'content', child: Text('Content Issue'.tr)),
        DropdownMenuItem(value: 'other', child: Text('Other'.tr)),
      ],
      onChanged: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a feedback type'.tr;
        }
        return null;
      },
    );
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement feedback submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you for your feedback!'.tr),
          backgroundColor: Colors.green,
        ),
      );

      // Clear form fields
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }
}
