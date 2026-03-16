import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/ad_card.dart';
import '../models/ad_model.dart';
import 'ad_detail_screen.dart';

class AllAdsScreen extends StatelessWidget {
  const AllAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ads = [
      AdModel(id: '1', title: 'آيفون 15 برو ماكس', description: 'جديد', price: 450000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'إلكترونيات', subCategory: 'هواتف', city: 'صنعاء', sellerId: 's1', sellerName: 'متجر', sellerRating: 4.8, createdAt: DateTime.now()),
      AdModel(id: '2', title: 'سيارة كامري 2020', description: 'نظيفة', price: 8500000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'سيارات', subCategory: 'تويوتا', city: 'عدن', sellerId: 's2', sellerName: 'معرض', sellerRating: 4.5, createdAt: DateTime.now()),
      AdModel(id: '3', title: 'شقة في حدة', description: '3 غرف', price: 35000000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'عقارات', subCategory: 'شقق', city: 'صنعاء', sellerId: 's3', sellerName: 'مكتب', sellerRating: 4.9, createdAt: DateTime.now()),
      AdModel(id: '4', title: 'ماك بوك برو', description: 'M1 Pro', price: 1200000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'إلكترونيات', subCategory: 'لابتوب', city: 'تعز', sellerId: 's4', sellerName: 'Apple', sellerRating: 5.0, createdAt: DateTime.now()),
    ];

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'جميع الإعلانات'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: ads.length,
          itemBuilder: (context, index) {
            return AdCard(
              ad: ads[index],
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdDetailScreen(ad: ads[index]))),
            );
          },
        ),
      ),
    );
  }
}
