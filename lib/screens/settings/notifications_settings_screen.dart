import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  bool _allNotifications = true;
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _smsNotifications = false;
  bool _promotionalNotifications = true;
  bool _orderUpdates = true;
  bool _chatMessages = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'إعدادات الإشعارات'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: SwitchListTile(
              title: const Text('جميع الإشعارات'),
              value: _allNotifications,
              onChanged: (value) {
                setState(() {
                  _allNotifications = value;
                  _pushNotifications = value;
                  _emailNotifications = value;
                  _smsNotifications = value;
                  _promotionalNotifications = value;
                  _orderUpdates = value;
                  _chatMessages = value;
                });
              },
              secondary: const Icon(Icons.notifications, color: AppTheme.goldColor),
            ),
          ),
          const SizedBox(height: 16),
          const Text('طرق الإشعارات', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('إشعارات الجوال'),
                  value: _pushNotifications,
                  onChanged: (value) => setState(() => _pushNotifications = value),
                  secondary: const Icon(Icons.phone_android, color: AppTheme.goldColor),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('البريد الإلكتروني'),
                  value: _emailNotifications,
                  onChanged: (value) => setState(() => _emailNotifications = value),
                  secondary: const Icon(Icons.email, color: AppTheme.goldColor),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('الرسائل النصية'),
                  value: _smsNotifications,
                  onChanged: (value) => setState(() => _smsNotifications = value),
                  secondary: const Icon(Icons.sms, color: AppTheme.goldColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
