import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class ${file%.dart} extends StatelessWidget {
  const ${file%.dart}({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: CustomAppBar(title: '${file%.dart}'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('قيد التطوير', style: TextStyle(fontFamily: 'Changa', fontSize: 24, fontWeight: FontWeight.bold, color: isDark ? AppTheme.darkText : AppTheme.lightText)),
            const SizedBox(height: 8),
            Text('سيتم إضافة هذه الخدمة قريباً', style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary)),
          ],
        ),
      ),
    );
  }
}
