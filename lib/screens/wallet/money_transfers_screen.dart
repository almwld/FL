import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class MoneyTransfersScreen extends StatelessWidget {
  const MoneyTransfersScreen({super.key});

  final List<Map<String, dynamic>> _transfers = const [
    {'name': 'تحويل إلى مشترك', 'icon': Icons.person_add, 'color': Colors.green},
    {'name': 'تحويل بين حساباتي', 'icon': Icons.compare_arrows, 'color': Colors.blue},
    {'name': 'حوالات شبكات محلية', 'icon': Icons.device_hub, 'color': Colors.orange},
    {'name': 'استلام حوالة', 'icon': Icons.download, 'color': Colors.purple},
    {'name': 'تحويل دولي', 'icon': Icons.public, 'color': Colors.teal},
    {'name': 'تحويل واصل', 'icon': Icons.wallet, 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: const CustomAppBar(title: 'تحويلات مالية'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          final transfer = _transfers[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (transfer['color'] as Color).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(transfer['icon'] as IconData, color: transfer['color']),
              ),
              title: Text(transfer['name'], style: const TextStyle(fontFamily: 'Changa')),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
