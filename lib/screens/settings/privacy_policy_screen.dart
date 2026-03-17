import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'سياسة الخصوصية'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('سياسة الخصوصية', style: TextStyle(fontFamily: 'Changa', fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
              const SizedBox(height: 24),
              _buildSection('المعلومات التي نجمعها', '• معلومات الحساب\n• معلومات الاستخدام\n• معلومات الدفع'),
              const SizedBox(height: 20),
              _buildSection('كيف نستخدم معلوماتك', '• لتقديم وتحسين خدماتنا\n• للتواصل معك\n• لضمان أمان المنصة'),
              const SizedBox(height: 20),
              _buildSection('مشاركة المعلومات', 'لا نشارك معلوماتك مع أطراف ثالثة إلا بموافقتك.'),
              const SizedBox(height: 24),
              const Text('آخر تحديث: 15 مارس 2026', style: TextStyle(fontFamily: 'Changa', color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(fontFamily: 'Changa', height: 1.6)),
      ],
    );
  }
}
