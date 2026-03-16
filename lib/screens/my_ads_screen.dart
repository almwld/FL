import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/ad_card.dart';
import '../models/ad_model.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final myAds = [
      AdModel(id: '1', title: 'آيفون 15 برو ماكس', description: 'جديد', price: 450000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'إلكترونيات', subCategory: 'هواتف', city: 'صنعاء', sellerId: 's1', sellerName: 'متجري', sellerRating: 4.8, createdAt: DateTime.now(), status: 'active'),
      AdModel(id: '2', title: 'لابتوب ديل', description: 'مستعمل', price: 200000, currency: 'YER', images: ['https://via.placeholder.com/300x200'], category: 'إلكترونيات', subCategory: 'لابتوب', city: 'صنعاء', sellerId: 's1', sellerName: 'متجري', sellerRating: 4.8, createdAt: DateTime.now(), status: 'sold'),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
        appBar: CustomAppBar(
          title: 'إعلاناتي',
          bottom: TabBar(
            indicatorColor: AppTheme.goldColor,
            labelColor: AppTheme.goldColor,
            unselectedLabelColor: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
            labelStyle: const TextStyle(fontFamily: 'Changa'),
            tabs: const [
              Tab(text: 'النشطة'),
              Tab(text: 'المباعة'),
              Tab(text: 'المعلقة'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAdsList(myAds.where((ad) => ad.status == 'active').toList()),
            _buildAdsList(myAds.where((ad) => ad.status == 'sold').toList()),
            _buildAdsList([]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppTheme.goldColor,
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildAdsList(List<AdModel> ads) {
    if (ads.isEmpty) {
      return const Center(
        child: Text(
          'لا توجد إعلانات',
          style: TextStyle(fontFamily: 'Changa'),
        ),
      );
    }
    return Padding(
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
          return AdCard(ad: ads[index]);
        },
      ),
    );
  }
}
