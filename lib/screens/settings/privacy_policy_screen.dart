import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'سياسة الخصوصية'),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text('''
سياسة الخصوصية لتطبيق Flex Yemen

نحن في Flex Yemen نلتزم بحماية خصوصية مستخدمينا. هذه السياسة توضح كيفية جمع واستخدام معلوماتك.

المعلومات التي نجمعها:
- معلومات الحساب (الاسم، رقم الهاتف، البريد الإلكتروني)
- معلومات الاستخدام (سجل التصفح، الإعلانات المفضلة)
- معلومات الدفع (لا نخزن بيانات بطاقات الائتمان)

كيف نستخدم معلوماتك:
- لتقديم وتحسين خدماتنا
- للتواصل معك
- لضمان أمان المنصة

مشاركة المعلومات:
لا نشارك معلوماتك مع أطراف ثالثة إلا بموافقتك.

آخر تحديث: 15 مارس 2026
          '''),
        ),
      ),
    );
  }
}
