import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'ad_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = ['آيفون', 'سيارة', 'شقة', 'لابتوب', 'أثاث'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
        elevation: 0,
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            controller: _searchController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'ابحث عن...',
              hintStyle: TextStyle(color: isDark ? Colors.grey[500] : Colors.grey[600]),
              prefixIcon: const Icon(Icons.search, color: AppTheme.goldColor),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () => _searchController.clear(),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onSubmitted: (value) {
              // تنفيذ البحث
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('عمليات البحث الأخيرة', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Changa', fontSize: 16)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _recentSearches.map((search) {
                return Chip(
                  label: Text(search, style: const TextStyle(fontFamily: 'Changa')),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () {
                    setState(() {
                      _recentSearches.remove(search);
                    });
                  },
                  backgroundColor: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text('الفئات الشائعة', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Changa', fontSize: 16)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildCategoryItem(Icons.phone_android, 'إلكترونيات'),
                _buildCategoryItem(Icons.directions_car, 'سيارات'),
                _buildCategoryItem(Icons.home, 'عقارات'),
                _buildCategoryItem(Icons.chair, 'أثاث'),
                _buildCategoryItem(Icons.restaurant, 'مطاعم'),
                _buildCategoryItem(Icons.sports_esports, 'ألعاب'),
                _buildCategoryItem(Icons.book, 'كتب'),
                _buildCategoryItem(Icons.pets, 'حيوانات'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.goldColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppTheme.goldColor),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontFamily: 'Changa', fontSize: 11)),
        ],
      ),
    );
  }
}
