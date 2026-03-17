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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('عام'),
            _buildCard(
              children: [
                SwitchListTile(
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
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('طرق الإشعارات'),
            _buildCard(
              children: [
                SwitchListTile(
                  title: const Text('إشعارات الجوال'),
                  value: _pushNotifications,
                  onChanged: (value) => setState(() => _pushNotifications = value),
                  secondary: const Icon(Icons.phone_android, color: AppTheme.goldColor),
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('البريد الإلكتروني'),
                  value: _emailNotifications,
                  onChanged: (value) => setState(() => _emailNotifications = value),
                  secondary: const Icon(Icons.email, color: AppTheme.goldColor),
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('الرسائل النصية'),
                  value: _smsNotifications,
                  onChanged: (value) => setState(() => _smsNotifications = value),
                  secondary: const Icon(Icons.sms, color: AppTheme.goldColor),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('أنواع الإشعارات'),
            _buildCard(
              children: [
                SwitchListTile(
                  title: const Text('العروض الترويجية'),
                  value: _promotionalNotifications,
                  onChanged: (value) => setState(() => _promotionalNotifications = value),
                  secondary: const Icon(Icons.local_offer, color: AppTheme.goldColor),
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('تحديثات الطلبات'),
                  value: _orderUpdates,
                  onChanged: (value) => setState(() => _orderUpdates = value),
                  secondary: const Icon(Icons.shopping_cart, color: AppTheme.goldColor),
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('الرسائل والمحادثات'),
                  value: _chatMessages,
                  onChanged: (value) => setState(() => _chatMessages = value),
                  secondary: const Icon(Icons.chat, color: AppTheme.goldColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppTheme.goldColor,
          fontFamily: 'Changa',
        ),
      ),
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}
