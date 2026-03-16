import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class PaymentsScreen extends StatelessWidget {
  final _billNumberController = TextEditingController();

  PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bills = [
      {'name': 'كهرباء', 'icon': Icons.electric_bolt, 'color': Color(0xFFFFC107)},
      {'name': 'ماء', 'icon': Icons.water_drop, 'color': Color(0xFF2196F3)},
      {'name': 'غاز', 'icon': Icons.local_fire_department, 'color': Color(0xFFFF5722)},
      {'name': 'إنترنت', 'icon': Icons.wifi, 'color': Color(0xFF4CAF50)},
      {'name': 'هاتف', 'icon': Icons.phone, 'color': Color(0xFF9C27B0)},
    ];

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'دفع فواتير'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: AppTheme.goldGradient, borderRadius: BorderRadius.circular(20)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('الرصيد الحالي', style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: Colors.black87)), SizedBox(height: 8), Text('125,000 ر.ي', style: TextStyle(fontFamily: 'Changa', fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black))])),
            const SizedBox(height: 24),
            Text('اختر نوع الفاتورة', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: isDark ? AppTheme.darkText : AppTheme.lightText)),
            const SizedBox(height: 16),
            GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1), itemCount: bills.length, itemBuilder: (context, index) {
              final bill = bills[index];
              return Container(margin: const EdgeInsets.all(8), decoration: BoxDecoration(color: isDark ? AppTheme.darkCard : AppTheme.lightCard, borderRadius: BorderRadius.circular(16)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(bill['icon'] as IconData, color: bill['color'] as Color, size: 32), const SizedBox(height: 8), Text(bill['name'] as String, style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: isDark ? AppTheme.darkText : AppTheme.lightText))]));
            }),
            const SizedBox(height: 24),
            CustomTextField(label: 'رقم الفاتورة', hint: 'أدخل رقم الفاتورة', controller: _billNumberController, prefixIcon: const Icon(Icons.receipt)),
            const SizedBox(height: 32),
            CustomButton(text: 'استعلام عن الفاتورة', onPressed: () {}, width: double.infinity),
          ],
        ),
      ),
    );
  }
}
