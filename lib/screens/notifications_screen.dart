import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> _notifications = const [
    {'title': 'عرض خاص', 'message': 'خصم 20% على جميع الإعلانات', 'time': 'منذ ساعة', 'icon': Icons.local_offer, 'color': Colors.orange},
    {'title': 'رسالة جديدة', 'message': 'أحمد محمد أرسل لك رسالة', 'time': 'منذ 3 ساعات', 'icon': Icons.message, 'color': Colors.blue},
    {'title': 'تمت الموافقة', 'message': 'تمت الموافقة على إعلانك', 'time': 'منذ يوم', 'icon': Icons.check_circle, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'الإشعارات'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notif = _notifications[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (notif['color'] as Color).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(notif['icon'] as IconData, color: notif['color']),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notif['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Changa')),
                      const SizedBox(height: 4),
                      Text(notif['message'], style: const TextStyle(color: Colors.grey, fontFamily: 'Changa')),
                      const SizedBox(height: 4),
                      Text(notif['time'], style: TextStyle(fontSize: 11, color: Colors.grey[500], fontFamily: 'Changa')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
