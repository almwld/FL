import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  final List<Map<String, String>> _faqs = const [
    {'q': 'كيف يمكنني إنشاء حساب جديد؟', 'a': 'من شاشة تسجيل الدخول اضغط على "إنشاء حساب جديد".'},
    {'q': 'كيف أضيف إعلاناً؟', 'a': 'من الشريط السفلي اضغط على أيقونة +.'},
    {'q': 'كيف أتواصل مع البائع؟', 'a': 'من صفحة الإعلان اضغط على "محادثة".'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'المساعدة والدعم'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('طرق التواصل', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildContactCard(Icons.chat, 'دردشة', Colors.green, isDark),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildContactCard(Icons.phone, 'اتصال', Colors.blue, isDark),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildContactCard(Icons.email, 'بريد', Colors.orange, isDark),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('الأسئلة الشائعة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ..._faqs.map((faq) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            child: ExpansionTile(
              title: Text(faq['q']!),
              children: [Padding(
                padding: const EdgeInsets.all(16),
                child: Text(faq['a']!),
              )],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String label, Color color, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
