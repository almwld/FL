import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifications = [
      {'title': 'طلب جديد', 'message': 'لديك طلب جديد على منتجك', 'time': 'منذ 5 دقائق', 'icon': Icons.shopping_bag, 'color': AppTheme.success},
      {'title': 'رسالة جديدة', 'message': 'أحمد أرسل لك رسالة', 'time': 'منذ ساعة', 'icon': Icons.message, 'color': AppTheme.info},
      {'title': 'تنبيه سعر', 'message': 'انخفض سعر المنتج في مفضلتك', 'time': 'منذ 3 ساعات', 'icon': Icons.trending_down, 'color': AppTheme.warning},
      {'title': 'مزاد ينتهي قريباً', 'message': 'مزادك سينتهي خلال ساعة', 'time': 'منذ 5 ساعات', 'icon': Icons.timer, 'color': AppTheme.error},
    ];

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'الإشعارات'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final n = notifications[index];
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
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: (n['color'] as Color).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(n['icon'] as IconData, color: n['color'] as Color),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        n['title'] as String,
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark ? AppTheme.darkText : AppTheme.lightText,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        n['message'] as String,
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 14,
                          color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  n['time'] as String,
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 12,
                    color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
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
