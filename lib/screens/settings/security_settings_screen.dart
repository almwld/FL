import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool _biometricEnabled = true;
  bool _twoFactorEnabled = false;
  bool _loginNotifications = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'الأمان والخصوصية'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: const Icon(Icons.lock, color: AppTheme.goldColor),
              title: const Text('تغيير كلمة المرور'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('تغيير كلمة المرور'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(obscureText: true, decoration: const InputDecoration(labelText: 'كلمة المرور الحالية')),
                        const SizedBox(height: 12),
                        TextField(obscureText: true, decoration: const InputDecoration(labelText: 'كلمة المرور الجديدة')),
                        const SizedBox(height: 12),
                        TextField(obscureText: true, decoration: const InputDecoration(labelText: 'تأكيد كلمة المرور')),
                      ],
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
                      ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('تأكيد')),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('البصمة / Face ID'),
                  value: _biometricEnabled,
                  onChanged: (value) => setState(() => _biometricEnabled = value),
                  secondary: const Icon(Icons.fingerprint, color: AppTheme.goldColor),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('التحقق بخطوتين'),
                  value: _twoFactorEnabled,
                  onChanged: (value) => setState(() => _twoFactorEnabled = value),
                  secondary: const Icon(Icons.security, color: AppTheme.goldColor),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('إشعارات تسجيل الدخول'),
                  value: _loginNotifications,
                  onChanged: (value) => setState(() => _loginNotifications = value),
                  secondary: const Icon(Icons.notifications, color: AppTheme.goldColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
