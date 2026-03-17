import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _chats = [
    {'name': 'أحمد محمد', 'message': 'مرحباً، هل المنتج متوفر؟', 'time': '10:30', 'unread': 2, 'avatar': 'أ', 'online': true},
    {'name': 'متجر التقنية', 'message': 'تم تأكيد طلبك بنجاح', 'time': '09:15', 'unread': 0, 'avatar': 'م', 'online': false},
    {'name': 'فاطمة علي', 'message': 'شكراً لك على التعامل', 'time': 'أمس', 'unread': 0, 'avatar': 'ف', 'online': false},
    {'name': 'معرض السيارات', 'message': 'متى يمكننا المعاينة؟', 'time': 'أمس', 'unread': 1, 'avatar': 'م', 'online': true},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'المحادثات'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          final chat = _chats[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ChatDetailScreen(name: chat['name'], avatar: chat['avatar'])),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppTheme.goldColor.withOpacity(0.2),
                      child: Text(chat['avatar'], style: const TextStyle(color: AppTheme.goldColor)),
                    ),
                    if (chat['online'])
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(width: 12, height: 12, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                      ),
                  ],
                ),
                title: Text(chat['name'], style: TextStyle(fontWeight: chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal)),
                subtitle: Text(chat['message'], maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(chat['time'], style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                    if (chat['unread'] > 0)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(color: AppTheme.goldColor, shape: BoxShape.circle),
                        child: Text(chat['unread'].toString(), style: const TextStyle(fontSize: 10, color: Colors.black)),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
