import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedMethod = 0;
  final List<Map<String, dynamic>> _paymentMethods = [
    {'name': 'المحفظة', 'balance': '125,000 ر.ي', 'icon': Icons.account_balance_wallet},
    {'name': 'بطاقة ائتمان', 'last4': '4242', 'icon': Icons.credit_card},
    {'name': 'تحويل بنكي', 'account': 'YE12 3456', 'icon': Icons.account_balance},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'إتمام الشراء'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('ملخص الطلب', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...List.generate(2, (i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Expanded(child: Text('منتج ${i + 1}')),
                        const Text('15,000 ر.ي'),
                      ],
                    ),
                  )),
                  const Divider(),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('الإجمالي'),
                    Text('30,000 ر.ي', style: TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('طريقة الدفع', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...List.generate(_paymentMethods.length, (index) {
              final method = _paymentMethods[index];
              return GestureDetector(
                onTap: () => setState(() => _selectedMethod = index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _selectedMethod == index ? AppTheme.goldColor : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(method['icon'], color: AppTheme.goldColor),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(method['name']),
                            if (method.containsKey('balance'))
                              Text('الرصيد: ${method['balance']}', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                          ],
                        ),
                      ),
                      Radio(value: index, groupValue: _selectedMethod, onChanged: (v) => setState(() => _selectedMethod = v!)),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
            CustomButton(
              text: 'تأكيد الدفع',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
                    content: const Text('تمت عملية الدفع بنجاح'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                        child: const Text('تم'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
