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
  final List<String> _recentSearches = ['آيفون', 'سيارة', 'شقة', 'لابتوب'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'البحث...',
              prefixIcon: const Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('عمليات البحث الأخيرة', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Changa')),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _recentSearches.map((search) {
                return Chip(
                  label: Text(search, style: const TextStyle(fontFamily: 'Changa')),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () {},
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text('نتائج البحث', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Changa')),
            const SizedBox(height: 12),
            ...List.generate(4, (index) => ListTile(
              leading: Container(width: 50, height: 50, color: Colors.grey[300]),
              title: Text('نتيجة بحث ${index + 1}'),
              subtitle: const Text('صنعاء • 25,000 ر.ي'),
              trailing: const Icon(Icons.favorite_border),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdDetailScreen(ad: null))),
            )),
          ],
        ),
      ),
    );
  }
}
