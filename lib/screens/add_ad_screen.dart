import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddAdScreen extends StatefulWidget {
  const AddAdScreen({super.key});

  @override
  State<AddAdScreen> createState() => _AddAdScreenState();
}

class _AddAdScreenState extends State<AddAdScreen> {
  String _selectedCategory = 'إلكترونيات';
  String _selectedCondition = 'new';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'إضافة إعلان جديد'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صور المنتج
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppTheme.goldColor.withOpacity(0.3),
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_photo_alternate, size: 50, color: AppTheme.goldColor),
                    const SizedBox(height: 8),
                    Text(
                      'أضف صور للمنتج',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              label: 'عنوان الإعلان',
              hint: 'مثال: آيفون 15 برو ماكس 256GB',
              prefixIcon: Icon(Icons.title),
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'السعر',
              hint: 'أدخل السعر',
              keyboardType: TextInputType.number,
              prefixIcon: Icon(Icons.attach_money),
            ),
            const SizedBox(height: 16),
            Text(
              'الفئة',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: ['إلكترونيات', 'سيارات', 'عقارات', 'أثاث', 'ملابس'].map((cat) {
                final isSelected = _selectedCategory == cat;
                return ChoiceChip(
                  label: Text(cat, style: const TextStyle(fontFamily: 'Changa')),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedCategory = cat),
                  selectedColor: AppTheme.goldColor,
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text(
              'حالة المنتج',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text('جديد', style: TextStyle(fontFamily: 'Changa')),
                    value: 'new',
                    groupValue: _selectedCondition,
                    onChanged: (v) => setState(() => _selectedCondition = v!),
                    activeColor: AppTheme.goldColor,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('مستعمل', style: TextStyle(fontFamily: 'Changa')),
                    value: 'used',
                    groupValue: _selectedCondition,
                    onChanged: (v) => setState(() => _selectedCondition = v!),
                    activeColor: AppTheme.goldColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'الوصف',
              hint: 'أضف وصفاً تفصيلياً للمنتج',
              maxLines: 5,
              prefixIcon: Icon(Icons.description_outlined),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'نشر الإعلان',
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
