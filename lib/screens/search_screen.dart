import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final recentSearches = ['آيفون', 'سيارة', 'شقة', 'لابتوب'];
    final categories = ['إلكترونيات', 'سيارات', 'عقارات', 'أثاث', 'ملابس'];

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: CustomAppBar(
        title: 'البحث',
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchField(
              hint: 'ابحث عن منتج، سيارة، عقار...',
            ),
            const SizedBox(height: 24),
            Text(
              'عمليات البحث الأخيرة',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: recentSearches.map((search) {
                return Chip(
                  label: Text(search, style: const TextStyle(fontFamily: 'Changa')),
                  deleteIcon: const Icon(Icons.close, size: 18),
                  onDeleted: () {},
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              'الفئات الشائعة',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.category, color: AppTheme.goldColor),
                  title: Text(
                    categories[index],
                    style: TextStyle(
                      fontFamily: 'Changa',
                      color: isDark ? AppTheme.darkText : AppTheme.lightText,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_back_ios, size: 16),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomSearchField({super.key, this.hint, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: 'Changa',
        color: isDark ? AppTheme.darkText : AppTheme.lightText,
      ),
      decoration: InputDecoration(
        hintText: hint ?? 'بحث...',
        prefixIcon: Icon(
          Icons.search,
          color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
        ),
        filled: true,
        fillColor: isDark ? AppTheme.darkCard : AppTheme.lightCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppTheme.goldColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        hintStyle: TextStyle(
          fontFamily: 'Changa',
          color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
        ),
      ),
    );
  }
}
