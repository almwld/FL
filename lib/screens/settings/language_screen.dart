import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'العربية';
  final List<Map<String, dynamic>> _languages = [
    {'name': 'العربية', 'code': 'ar', 'flag': '🇸🇦'},
    {'name': 'English', 'code': 'en', 'flag': '🇬🇧'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'اللغة'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          final lang = _languages[index];
          final isSelected = _selectedLanguage == lang['name'];
          return Card(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Text(lang['flag'], style: const TextStyle(fontSize: 24)),
              title: Text(lang['name']),
              trailing: isSelected ? const Icon(Icons.check, color: AppTheme.goldColor) : null,
              onTap: () => setState(() => _selectedLanguage = lang['name']),
            ),
          );
        },
      ),
    );
  }
}
