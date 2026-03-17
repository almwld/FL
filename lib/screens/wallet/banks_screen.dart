import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class BanksScreen extends StatelessWidget {
  const BanksScreen({super.key});

  final List<String> _banks = const [
    'البنك الأهلي اليمني',
    'كاك بنك',
    'بنك الكريمي',
    'بنك اليمن والكويت',
    'بنك التسليف التعاوني',
    'البنك الإسلامي',
    'بنك عدن',
    'مصرف اليمن والبحرين',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: const CustomAppBar(title: 'بنوك'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _banks.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.goldColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.account_balance, color: AppTheme.goldColor, size: 24),
              ),
              title: Text(_banks[index], style: const TextStyle(fontFamily: 'Changa')),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
