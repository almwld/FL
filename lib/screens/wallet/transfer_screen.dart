import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _amountController = TextEditingController();
  final _recipientController = TextEditingController();
  final _noteController = TextEditingController();
  String _selectedCurrency = 'YER';

  @override
  void dispose() {
    _amountController.dispose();
    _recipientController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'تحويل'),
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
            CustomTextField(
              label: 'رقم المستلم أو البريد الإلكتروني',
              hint: 'أدخل بيانات المستلم',
              controller: _recipientController,
              prefixIcon: const Icon(Icons.person_outline),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'المبلغ',
              hint: 'أدخل المبلغ',
              controller: _amountController,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.attach_money),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'ملاحظة (اختياري)',
              hint: 'أضف ملاحظة للتحويل',
              controller: _noteController,
              maxLines: 3,
              prefixIcon: const Icon(Icons.note_outlined),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'تحويل',
              onPressed: () {},
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
}
