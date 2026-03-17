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
          return GestureDetector(
            onTap: () {
              setState(() => _selectedLanguage = lang['name']);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppTheme.goldColor : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Text(lang['flag'], style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      lang['name'],
                      style: const TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  if (isSelected)
                    const Icon(Icons.check, color: AppTheme.goldColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
