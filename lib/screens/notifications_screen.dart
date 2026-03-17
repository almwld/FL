import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> _notifications = const [
    {'title': 'عرض خاص', 'message': 'خصم 20% على جميع الإعلانات', 'time': 'منذ ساعة', 'icon': Icons.local_offer, 'color': Colors.orange, 'isRead': false},
    {'title': 'رسالة جديدة', 'message': 'أحمد محمد أرسل لك رسالة', 'time': 'منذ 3 ساعات', 'icon': Icons.message, 'color': Colors.blue, 'isRead': false},
    {'title': 'تمت الموافقة', 'message': 'تمت الموافقة على إعلانك', 'time': 'منذ يوم', 'icon': Icons.check_circle, 'color': Colors.green, 'isRead': true},
    {'title': 'إعلان منتهي', 'message': 'إعلانك "آيفون" انتهى', 'time': 'منذ يومين', 'icon': Icons.timer, 'color': Colors.red, 'isRead': true},
    {'title': 'تحديث التطبيق', 'message': 'نسخة جديدة متاحة', 'time': 'منذ 3 أيام', 'icon': Icons.update, 'color': Colors.purple, 'isRead': true},
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
              border: notif['isRead'] == false
                  ? Border.all(color: AppTheme.goldColor, width: 1)
                  : null,
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notif['title'],
                              style: TextStyle(
                                fontWeight: notif['isRead'] == false ? FontWeight.bold : FontWeight.normal,
                                fontFamily: 'Changa',
                              ),
                            ),
                          ),
                          if (notif['isRead'] == false)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppTheme.goldColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notif['message'],
                        style: TextStyle(color: Colors.grey[500], fontFamily: 'Changa'),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notif['time'],
                        style: TextStyle(fontSize: 11, color: Colors.grey[500], fontFamily: 'Changa'),
                      ),
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
