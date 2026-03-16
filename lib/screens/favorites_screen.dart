import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/ad_card.dart';
import '../models/ad_model.dart';
import 'ad_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final favorites = [
      AdModel(id: '1', title: 'آيفون 15 برو ماكس', description: 'جديد', price: 450000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'إلكترونيات', subCategory: 'هواتف', city: 'صنعاء', sellerId: 's1', sellerName: 'متجر', sellerRating: 4.8, createdAt: DateTime.now()),
      AdModel(id: '3', title: 'شقة في حدة', description: '3 غرف', price: 35000000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'عقارات', subCategory: 'شقق', city: 'صنعاء', sellerId: 's3', sellerName: 'مكتب', sellerRating: 4.9, createdAt: DateTime.now()),
    ];

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'المفضلة'),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد عناصر في المفضلة',
                    style: TextStyle(fontFamily: 'Changa', fontSize: 18, color: isDark ? AppTheme.darkText : AppTheme.lightText),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return AdCard(
                    ad: favorites[index],
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdDetailScreen(ad: favorites[index]))),
                    isFavorite: true,
                  );
                },
              ),
            ),
    );
  }
}
