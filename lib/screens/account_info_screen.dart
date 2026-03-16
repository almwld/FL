import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'معلومات الحساب'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: AppTheme.goldGradient,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(Icons.person, size: 60, color: Colors.black),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, size: 20, color: AppTheme.goldColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const CustomTextField(
              label: 'الاسم الكامل',
              hint: 'محمد أحمد',
              prefixIcon: Icon(Icons.person_outline),
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'البريد الإلكتروني',
              hint: 'mohammed@email.com',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'رقم الموبايل',
              hint: '771234567',
              prefixIcon: Icon(Icons.phone_outlined),
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'المدينة',
              hint: 'صنعاء',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'حفظ التغييرات',
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
