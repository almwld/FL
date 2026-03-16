import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final _amountController = TextEditingController();
  String _selectedCurrency = 'YER';
  String _selectedMethod = 'bank';

  final List<Map<String, dynamic>> _methods = [
    {'id': 'bank', 'name': 'تحويل بنكي', 'icon': Icons.account_balance},
    {'id': 'krem', 'name': 'كريمي', 'icon': Icons.money},
    {'id': 'card', 'name': 'بطاقة ائتمان', 'icon': Icons.credit_card},
    {'id': 'cash', 'name': 'إيداع نقدي', 'icon': Icons.payments},
  ];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'إيداع'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الرصيد
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppTheme.goldGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الرصيد الحالي',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '125,000 ر.ي',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // اختيار العملة
            Text(
              'اختر العملة',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildCurrencyButton('YER', 'ريال يمني'),
                const SizedBox(width: 8),
                _buildCurrencyButton('SAR', 'ريال سعودي'),
                const SizedBox(width: 8),
                _buildCurrencyButton('USD', 'دولار'),
              ],
            ),

            const SizedBox(height: 24),

            // المبلغ
            CustomTextField(
              label: 'المبلغ',
              hint: 'أدخل المبلغ',
              controller: _amountController,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.attach_money),
            ),

            const SizedBox(height: 24),

            // طريقة الإيداع
            Text(
              'طريقة الإيداع',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            ),
            const SizedBox(height: 12),
            ..._methods.map((method) => _buildMethodItem(method)),

            const SizedBox(height: 32),

            // زر الإيداع
            CustomButton(
              text: 'إيداع',
              onPressed: () {
                // TODO: Implement deposit
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyButton(String code, String name) {
    final isSelected = _selectedCurrency == code;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedCurrency = code),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.goldColor
                : (isDark ? AppTheme.darkCard : AppTheme.lightCard),
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? null
                : Border.all(
                    color: isDark
                        ? AppTheme.darkTextSecondary.withOpacity(0.3)
                        : AppTheme.lightTextSecondary.withOpacity(0.3),
                  ),
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Changa',
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected
                  ? Colors.black
                  : (isDark ? AppTheme.darkText : AppTheme.lightText),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMethodItem(Map<String, dynamic> method) {
    final isSelected = _selectedMethod == method['id'];
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = method['id']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: AppTheme.goldColor, width: 2)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              method['icon'] as IconData,
              color: isSelected ? AppTheme.goldColor : AppTheme.goldDark,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                method['name'] as String,
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 16,
                  color: isDark ? AppTheme.darkText : AppTheme.lightText,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppTheme.goldColor,
              ),
          ],
        ),
      ),
    );
  }
}
