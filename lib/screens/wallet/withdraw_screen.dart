import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('سحب'),
      ),
      body: const Center(
        child: Text('قيد التطوير'),
      ),
    );
  }
}
