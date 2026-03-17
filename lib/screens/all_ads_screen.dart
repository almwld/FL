import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../models/ad_model.dart';
import 'ad_detail_screen.dart';

class AllAdsScreen extends StatefulWidget {
  const AllAdsScreen({super.key});

  @override
  State<AllAdsScreen> createState() => _AllAdsScreenState();
}

class _AllAdsScreenState extends State<AllAdsScreen> {
  late List<AdModel> _ads;

  @override
  void initState() {
    super.initState();
    _ads = [
      // إعلانات متنوعة
      AdModel(id: '1', title: 'آيفون 15 برو ماكس 256GB', description: 'جديد بالكرتونة - ضمان سنة', price: 450000, currency: 'YER', images: ['https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=300'], category: 'إلكترونيات', subCategory: 'هواتف', city: 'صنعاء', sellerId: '1', sellerName: 'متجر التقنية', sellerRating: 4.8, createdAt: DateTime.now()),
      AdModel(id: '2', title: 'تويوتا كامري 2020 فل كامل', description: 'ماشية 50 الف - شرط الفحص', price: 8500000, currency: 'YER', images: ['https://images.unsplash.com/photo-1621007947382-bb3c3968e3bb?w=300'], category: 'سيارات', subCategory: 'تويوتا', city: 'عدن', sellerId: '2', sellerName: 'معرض السيارات', sellerRating: 4.5, createdAt: DateTime.now()),
      AdModel(id: '3', title: 'شقة فاخرة للبيع في حدة', description: '3 غرف + صالة + 2 حمام', price: 35000000, currency: 'YER', images: ['https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=300'], category: 'عقارات', subCategory: 'شقق', city: 'صنعاء', sellerId: '3', sellerName: 'مكتب العقارات', sellerRating: 4.9, createdAt: DateTime.now()),
      AdModel(id: '4', title: 'ماك بوك برو M1 512GB', description: 'مستعمل نظيف - بطارية 90%', price: 1200000, currency: 'YER', images: ['https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=300'], category: 'إلكترونيات', subCategory: 'لابتوب', city: 'تعز', sellerId: '4', sellerName: 'Apple Store', sellerRating: 5.0, createdAt: DateTime.now()),
      
      // إعلانات إضافية
      AdModel(id: '5', title: 'سامسونج S24 الترا', description: '512GB - جديد', price: 380000, currency: 'YER', images: ['https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=300'], category: 'إلكترونيات', subCategory: 'هواتف', city: 'صنعاء', sellerId: '5', sellerName: 'متجر الجوالات', sellerRating: 4.3, createdAt: DateTime.now()),
      AdModel(id: '6', title: 'مرسيدس E300 2022', description: 'وكالة - فاخرة', price: 15000000, currency: 'YER', images: ['https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=300'], category: 'سيارات', subCategory: 'مرسيدس', city: 'صنعاء', sellerId: '6', sellerName: 'معرض الفخامة', sellerRating: 4.7, createdAt: DateTime.now()),
      AdModel(id: '7', title: 'أرض استثمارية في مأرب', description: '500 متر - تجاري', price: 25000000, currency: 'YER', images: ['https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=300'], category: 'عقارات', subCategory: 'أراضي', city: 'مأرب', sellerId: '7', sellerName: 'مكتب الأراضي', sellerRating: 4.2, createdAt: DateTime.now()),
      AdModel(id: '8', title: 'لابتوب لينوفو Legion 5', description: 'للألعاب - RTX 3060', price: 900000, currency: 'YER', images: ['https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?w=300'], category: 'إلكترونيات', subCategory: 'لابتوب', city: 'عدن', sellerId: '8', sellerName: 'كمبيوتر هاوس', sellerRating: 4.4, createdAt: DateTime.now()),
      
      AdModel(id: '9', title: 'هونداي النترا 2021', description: 'نظيفة جداً', price: 5500000, currency: 'YER', images: ['https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=300'], category: 'سيارات', subCategory: 'هونداي', city: 'الحديدة', sellerId: '9', sellerName: 'معرض الحدادة', sellerRating: 4.1, createdAt: DateTime.now()),
      AdModel(id: '10', title: 'آيباد برو 12.9 M2', description: 'مع قلم وبورد', price: 300000, currency: 'YER', images: ['https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=300'], category: 'إلكترونيات', subCategory: 'تابلت', city: 'صنعاء', sellerId: '10', sellerName: 'متجر أبل', sellerRating: 4.9, createdAt: DateTime.now()),
      AdModel(id: '11', title: 'شقة في عدن', description: '2 غرف - إطلالة بحر', price: 28000000, currency: 'YER', images: ['https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=300'], category: 'عقارات', subCategory: 'شقق', city: 'عدن', sellerId: '11', sellerName: 'مكة للعقارات', sellerRating: 4.6, createdAt: DateTime.now()),
      AdModel(id: '12', title: 'ساعة أبل الترا 2', description: 'شرائح جديدة', price: 95000, currency: 'YER', images: ['https://images.unsplash.com/photo-1693966356303-c1d85b7b1841?w=300'], category: 'إلكترونيات', subCategory: 'ساعات', city: 'صنعاء', sellerId: '12', sellerName: 'متجر الساعات', sellerRating: 4.3, createdAt: DateTime.now()),
      
      AdModel(id: '13', title: 'شاص 2024', description: 'صفر - زيرو', price: 12500000, currency: 'YER', images: ['https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=300'], category: 'سيارات', subCategory: 'تويوتا', city: 'صنعاء', sellerId: '13', sellerName: 'توكيل تويوتا', sellerRating: 5.0, createdAt: DateTime.now()),
      AdModel(id: '14', title: 'بيت في تعز', description: 'دور كامل - 150 متر', price: 45000000, currency: 'YER', images: ['https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=300'], category: 'عقارات', subCategory: 'بيوت', city: 'تعز', sellerId: '14', sellerName: 'الركن الآمن', sellerRating: 4.5, createdAt: DateTime.now()),
      AdModel(id: '15', title: 'سماعات ايربودز برو', description: 'اصلية - مع الضمان', price: 45000, currency: 'YER', images: ['https://images.unsplash.com/photo-1603351154359-1f3051d68b9d?w=300'], category: 'إلكترونيات', subCategory: 'سماعات', city: 'صنعاء', sellerId: '15', sellerName: 'متجر الإكسسوارات', sellerRating: 4.2, createdAt: DateTime.now()),
      AdModel(id: '16', title: 'أثاث غرفة نوم كاملة', description: 'مودرن - بحالة ممتازة', price: 650000, currency: 'YER', images: ['https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=300'], category: 'أثاث', subCategory: 'غرف نوم', city: 'صنعاء', sellerId: '16', sellerName: 'معرض الأثاث', sellerRating: 4.7, createdAt: DateTime.now()),
      
      AdModel(id: '17', title: 'جوال شاومي 14 الترا', description: 'كاميرا لايكا', price: 280000, currency: 'YER', images: ['https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=300'], category: 'إلكترونيات', subCategory: 'هواتف', city: 'صنعاء', sellerId: '17', sellerName: 'متجر شاومي', sellerRating: 4.3, createdAt: DateTime.now()),
      AdModel(id: '18', title: 'فيلا في المكلا', description: '300 متر - حوض سباحة', price: 65000000, currency: 'YER', images: ['https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=300'], category: 'عقارات', subCategory: 'فلل', city: 'المكلا', sellerId: '18', sellerName: 'عقارات حضرموت', sellerRating: 4.8, createdAt: DateTime.now()),
      AdModel(id: '19', title: 'بلاي ستيشن 5', description: 'بضمان الوكيل', price: 250000, currency: 'YER', images: ['https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=300'], category: 'ألعاب', subCategory: 'بلاي ستيشن', city: 'صنعاء', sellerId: '19', sellerName: 'متجر الألعاب', sellerRating: 4.6, createdAt: DateTime.now()),
      AdModel(id: '20', title: 'لاندكروزر 2023', description: 'GXR - فل', price: 22000000, currency: 'YER', images: ['https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=300'], category: 'سيارات', subCategory: 'تويوتا', city: 'صنعاء', sellerId: '20', sellerName: 'معرض السيارات الفاخرة', sellerRating: 4.9, createdAt: DateTime.now()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'جميع الإعلانات'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _ads.length,
        itemBuilder: (context, index) {
          final ad = _ads[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdDetailScreen(ad: ad))),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(ad.images[0], fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ad.title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                          const Spacer(),
                          Text('${ad.formattedPrice} ${ad.currencySymbol}', style: const TextStyle(color: AppTheme.goldColor)),
                          Text(ad.city, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
