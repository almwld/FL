import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class WithdrawScreen extends StatelessWidget {
  final _amountController = TextEditingController();
  final _accountController = TextEditingController();

  WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'سحب'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppTheme.goldGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الرصيد الحالي', style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: Colors.black87)),
                  SizedBox(height: 8),
                  Text('125,000 ر.ي', style: TextStyle(fontFamily: 'Changa', fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              label: 'المبلغ',
              hint: 'أدخل المبلغ المراد سحبه',
              controller: _amountController,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.attach_money),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'رقم الحساب أو المحفظة',
              hint: 'أدخل رقم الحساب',
              controller: _accountController,
              prefixIcon: const Icon(Icons.account_balance_wallet_outlined),
            ),
            const SizedBox(height: 24),
            Text('طريقة السحب', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: isDark ? AppTheme.darkText : AppTheme.lightText)),
            const SizedBox(height: 12),
            _buildMethodItem(Icons.account_balance, 'تحويل بنكي'),
            _buildMethodItem(Icons.phone_android, 'كريمي'),
            _buildMethodItem(Icons.money, 'حوالة صرافة'),
            const SizedBox(height: 32),
            CustomButton(text: 'سحب', onPressed: () {}, width: double.infinity),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodItem(IconData icon, String name) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: isDark ? AppTheme.darkCard : AppTheme.lightCard, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [Icon(icon, color: AppTheme.goldColor), const SizedBox(width: 12), Expanded(child: Text(name, style: TextStyle(fontFamily: 'Changa', fontSize: 16, color: isDark ? AppTheme.darkText : AppTheme.lightText))), const Icon(Icons.arrow_back_ios, size: 16, color: AppTheme.goldColor)]),
    );
  }
}
