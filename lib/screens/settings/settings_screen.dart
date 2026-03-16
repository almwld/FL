import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../providers/theme_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'الإعدادات'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('المظهر'),
          _buildSettingItem(
            context,
            icon: Icons.dark_mode,
            title: 'الوضع الداكن',
            trailing: Switch(
              value: themeManager.isDarkMode,
              onChanged: (_) => themeManager.toggleTheme(),
              activeColor: AppTheme.goldColor,
            ),
          ),
          const Divider(),
          _buildSectionTitle('الإشعارات'),
          _buildSettingItem(
            context,
            icon: Icons.notifications,
            title: 'إشعارات الرسائل',
            trailing: Switch(
              value: true,
              onChanged: (_) {},
              activeColor: AppTheme.goldColor,
            ),
          ),
          _buildSettingItem(
            context,
            icon: Icons.local_offer,
            title: 'إشعارات العروض',
            trailing: Switch(
              value: true,
              onChanged: (_) {},
              activeColor: AppTheme.goldColor,
            ),
          ),
          const Divider(),
          _buildSectionTitle('الحساب'),
          _buildSettingItem(
            context,
            icon: Icons.lock,
            title: 'تغيير كلمة المرور',
            onTap: () {},
          ),
          _buildSettingItem(
            context,
            icon: Icons.language,
            title: 'اللغة',
            subtitle: 'العربية',
            onTap: () {},
          ),
          const Divider(),
          _buildSectionTitle('عن التطبيق'),
          _buildSettingItem(
            context,
            icon: Icons.info,
            title: 'الإصدار',
            subtitle: '1.0.0',
          ),
          _buildSettingItem(
            context,
            icon: Icons.privacy_tip,
            title: 'سياسة الخصوصية',
            onTap: () {},
          ),
          _buildSettingItem(
            context,
            icon: Icons.help,
            title: 'المساعدة والدعم',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Changa',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTheme.goldColor,
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Icon(icon, color: AppTheme.goldColor),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Changa',
          color: isDark ? AppTheme.darkText : AppTheme.lightText,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Changa',
                color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
              ),
            )
          : null,
      trailing: trailing ?? const Icon(Icons.arrow_back_ios, size: 16, color: AppTheme.goldColor),
      onTap: onTap,
    );
  }
}
