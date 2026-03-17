import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class AllAdsScreen extends StatelessWidget {
  const AllAdsScreen({super.key});

  final List<Map<String, dynamic>> _allCategories = const [
    // الإلكترونيات (7)
    {'name': 'هواتف ذكية', 'icon': Icons.phone_android, 'color': Colors.blue},
    {'name': 'لابتوب', 'icon': Icons.laptop, 'color': Colors.indigo},
    {'name': 'تابلت', 'icon': Icons.tablet, 'color': Colors.cyan},
    {'name': 'ساعات ذكية', 'icon': Icons.watch, 'color': Colors.teal},
    {'name': 'كاميرات', 'icon': Icons.camera_alt, 'color': Colors.purple},
    {'name': 'سماعات', 'icon': Icons.headphones, 'color': Colors.deepPurple},
    {'name': 'اكسسوارات', 'icon': Icons.usb, 'color': Colors.pink},

    // السيارات (8)
    {'name': 'سيارات للبيع', 'icon': Icons.directions_car, 'color': Colors.red},
    {'name': 'سيارات للإيجار', 'icon': Icons.car_rental, 'color': Colors.orange},
    {'name': 'قطع غيار', 'icon': Icons.build, 'color': Colors.brown},
    {'name': 'اكسسوارات سيارات', 'icon': Icons.tire_repair, 'color': Colors.grey},
    {'name': 'دراجات نارية', 'icon': Icons.motorcycle, 'color': Colors.deepOrange},
    {'name': 'قوارب', 'icon': Icons.sailing, 'color': Colors.lightBlue},
    {'name': 'شاحنات', 'icon': Icons.local_shipping, 'color': Colors.amber},
    {'name': 'معدات ثقيلة', 'icon': Icons.construction, 'color': Colors.yellow},

    // العقارات (6)
    {'name': 'شقق للبيع', 'icon': Icons.apartment, 'color': Colors.green},
    {'name': 'شقق للإيجار', 'icon': Icons.home, 'color': Colors.lightGreen},
    {'name': 'فلل', 'icon': Icons.villa, 'color': Colors.lime},
    {'name': 'أراضي', 'icon': Icons.terrain, 'color': Colors.green},
    {'name': 'محلات', 'icon': Icons.store, 'color': Colors.teal},
    {'name': 'مكاتب', 'icon': Icons.business, 'color': Colors.blueGrey},

    // الأثاث (5)
    {'name': 'غرف نوم', 'icon': Icons.bed, 'color': Colors.brown},
    {'name': 'غرف معيشة', 'icon': Icons.chair, 'color': Colors.amber},
    {'name': 'مطابخ', 'icon': Icons.kitchen, 'color': Colors.deepOrange},
    {'name': 'مكاتب', 'icon': Icons.desk, 'color': Colors.indigo},
    {'name': 'إضاءة', 'icon': Icons.light, 'color': Colors.yellow},

    // الملابس (6)
    {'name': 'رجالي', 'icon': Icons.man, 'color': Colors.blue},
    {'name': 'نسائي', 'icon': Icons.woman, 'color': Colors.pink},
    {'name': 'أطفال', 'icon': Icons.child_care, 'color': Colors.teal},
    {'name': 'أحذية', 'icon': Icons.shopping_bag, 'color': Colors.brown},
    {'name': 'اكسسوارات', 'icon': Icons.watch, 'color': Colors.purple},
    {'name': 'ساعات', 'icon': Icons.watch, 'color': Colors.deepPurple},

    // المطاعم والأكل (5)
    {'name': 'مطاعم', 'icon': Icons.restaurant, 'color': Colors.red},
    {'name': 'مقاهي', 'icon': Icons.local_cafe, 'color': Colors.brown},
    {'name': 'حلويات', 'icon': Icons.cake, 'color': Colors.pink},
    {'name': 'مخابز', 'icon': Icons.bakery_dining, 'color': Colors.orange},
    {'name': 'وجبات سريعة', 'icon': Icons.fastfood, 'color': Colors.deepOrange},

    // الخدمات (7)
    {'name': 'صيانة', 'icon': Icons.build, 'color': Colors.grey},
    {'name': 'تنظيف', 'icon': Icons.cleaning_services, 'color': Colors.cyan},
    {'name': 'تصليح', 'icon': Icons.plumbing, 'color': Colors.brown},
    {'name': 'نقل', 'icon': Icons.local_shipping, 'color': Colors.amber},
    {'name': 'تعليم', 'icon': Icons.school, 'color': Colors.green},
    {'name': 'صحة', 'icon': Icons.health_and_safety, 'color': Colors.red},
    {'name': 'جمال', 'icon': Icons.face, 'color': Colors.pink},

    // الحيوانات (4)
    {'name': 'كلاب', 'icon': Icons.pets, 'color': Colors.brown},
    {'name': 'قطط', 'icon': Icons.pets, 'color': Colors.orange},
    {'name': 'طيور', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'أسماك', 'icon': Icons.set_meal, 'color': Colors.teal},

    // الرياضة (4)
    {'name': 'أدوات رياضية', 'icon': Icons.sports, 'color': Colors.green},
    {'name': 'ملابس رياضية', 'icon': Icons.sports_handball, 'color': Colors.orange},
    {'name': 'أندية', 'icon': Icons.sports_soccer, 'color': Colors.blue},
    {'name': 'معدات', 'icon': Icons.fitness_center, 'color': Colors.red},

    // الكتب والقرطاسية (3)
    {'name': 'كتب', 'icon': Icons.book, 'color': Colors.brown},
    {'name': 'قرطاسية', 'icon': Icons.create, 'color': Colors.purple},
    {'name': 'مستلزمات مدرسية', 'icon': Icons.school, 'color': Colors.green},

    // الألعاب (4)
    {'name': 'ألعاب إلكترونية', 'icon': Icons.videogame_asset, 'color': Colors.red},
    {'name': 'ألعاب أطفال', 'icon': Icons.toys, 'color': Colors.pink},
    {'name': 'دمى', 'icon': Icons.emoji_people, 'color': Colors.purple},
    {'name': 'ليغو', 'icon': Icons.extension, 'color': Colors.amber},

    // الصحة والجمال (8)
    {'name': 'مستحضرات تجميل', 'icon': Icons.face, 'color': Colors.pink},
    {'name': 'عناية بالبشرة', 'icon': Icons.spa, 'color': Colors.purple},
    {'name': 'عطور', 'icon': Icons.emoji_emotions, 'color': Colors.amber},
    {'name': 'مكياج', 'icon': Icons.brush, 'color': Colors.red},
    {'name': 'أدوات حلاقة', 'icon': Icons.cut, 'color': Colors.blue},
    {'name': 'عناية بالشعر', 'icon': Icons.content_cut, 'color': Colors.teal},
    {'name': 'سبا', 'icon': Icons.hot_tub, 'color': Colors.cyan},
    {'name': 'صيدليات', 'icon': Icons.local_pharmacy, 'color': Colors.green},

    // الأجهزة المنزلية (7)
    {'name': 'ثلاجات', 'icon': Icons.kitchen, 'color': Colors.cyan},
    {'name': 'غسالات', 'icon': Icons.local_laundry_service, 'color': Colors.blue},
    {'name': 'مكيفات', 'icon': Icons.ac_unit, 'color': Colors.lightBlue},
    {'name': 'أفران', 'icon': Icons.kitchen, 'color': Colors.orange},
    {'name': 'مكانس', 'icon': Icons.cleaning_services, 'color': Colors.purple},
    {'name': 'مراوح', 'icon': Icons.toys, 'color': Colors.green},
    {'name': 'سخانات', 'icon': Icons.water, 'color': Colors.red},

    // المطبخ والطعام (6)
    {'name': 'أواني', 'icon': Icons.kitchen, 'color': Colors.brown},
    {'name': 'أجهزة مطبخ', 'icon': Icons.coffee_maker, 'color': Colors.amber},
    {'name': 'بهارات', 'icon': Icons.grass, 'color': Colors.green},
    {'name': 'تمور', 'icon': Icons.date_range, 'color': Colors.brown},
    {'name': 'عسل', 'icon': Icons.water_drop, 'color': Colors.amber},
    {'name': 'قهوة', 'icon': Icons.coffee, 'color': Colors.brown},

    // الحرف والتحف (5)
    {'name': 'جنابي', 'icon': Icons.agriculture, 'color': Colors.brown},
    {'name': 'سجاد', 'icon': Icons.carpenter, 'color': Colors.red},
    {'name': 'فضيات', 'icon': Icons.diamond, 'color': Colors.grey},
    {'name': 'نحاسيات', 'icon': Icons.kitchen, 'color': Colors.amber},
    {'name': 'تحف', 'icon': Icons.history, 'color': Colors.brown},

    // مواد البناء (6)
    {'name': 'حديد', 'icon': Icons.construction, 'color': Colors.grey},
    {'name': 'أسمنت', 'icon': Icons.inventory, 'color': Colors.brown},
    {'name': 'رمل', 'icon': Icons.landscape, 'color': Colors.yellow},
    {'name': 'سيراميك', 'icon': Icons.grid_on, 'color': Colors.blue},
    {'name': 'دهانات', 'icon': Icons.brush, 'color': Colors.purple},
    {'name': 'أدوات صحية', 'icon': Icons.bathtub, 'color': Colors.cyan},

    // الزراعة (5)
    {'name': 'بذور', 'icon': Icons.grass, 'color': Colors.green},
    {'name': 'شتلات', 'icon': Icons.eco, 'color': Colors.lightGreen},
    {'name': 'أسمدة', 'icon': Icons.agriculture, 'color': Colors.brown},
    {'name': 'مبيدات', 'icon': Icons.science, 'color': Colors.red},
    {'name': 'أدوات زراعية', 'icon': Icons.gardening, 'color': Colors.orange},

    // التعليم (4)
    {'name': 'دورات', 'icon': Icons.school, 'color': Colors.blue},
    {'name': 'كتب تعليمية', 'icon': Icons.menu_book, 'color': Colors.green},
    {'name': 'مستلزمات', 'icon': Icons.backpack, 'color': Colors.orange},
    {'name': 'معاهد', 'icon': Icons.location_city, 'color': Colors.purple},

    // السفر (4)
    {'name': 'فنادق', 'icon': Icons.hotel, 'color': Colors.blue},
    {'name': 'رحلات', 'icon': Icons.tour, 'color': Colors.green},
    {'name': 'تذاكر', 'icon': Icons.flight, 'color': Colors.orange},
    {'name': 'تأجير سيارات', 'icon': Icons.car_rental, 'color': Colors.red},

    // المزادات (3)
    {'name': 'مزادات سيارات', 'icon': Icons.directions_car, 'color': Colors.red},
    {'name': 'مزادات عقارات', 'icon': Icons.home, 'color': Colors.green},
    {'name': 'مزادات تحف', 'icon': Icons.history, 'color': Colors.brown},

    // التبرعات (3)
    {'name': 'تبرعات مالية', 'icon': Icons.volunteer_activism, 'color': Colors.green},
    {'name': 'تبرعات عينية', 'icon': Icons.card_giftcard, 'color': Colors.orange},
    {'name': 'حملات خيرية', 'icon': Icons.favorite, 'color': Colors.red},

    // الكماليات (4)
    {'name': 'هدايا', 'icon': Icons.card_giftcard, 'color': Colors.red},
    {'name': 'ساعات فاخرة', 'icon': Icons.watch, 'color': Colors.amber},
    {'name': 'نظارات', 'icon': Icons.visibility, 'color': Colors.blue},
    {'name': 'مجوهرات', 'icon': Icons.diamond, 'color': Colors.purple},

    // المعدات الثقيلة (4)
    {'name': 'حفارات', 'icon': Icons.construction, 'color': Colors.yellow},
    {'name': 'رافعات', 'icon': Icons.construction, 'color': Colors.orange},
    {'name': 'بلدوزرات', 'icon': Icons.do_not_disturb, 'color': Colors.red},
    {'name': 'شيولات', 'icon': Icons.local_shipping, 'color': Colors.blue},

    // البرمجيات (3)
    {'name': 'تطبيقات', 'icon': Icons.apps, 'color': Colors.blue},
    {'name': 'برامج', 'icon': Icons.computer, 'color': Colors.green},
    {'name': 'ألعاب', 'icon': Icons.videogame_asset, 'color': Colors.purple},

    // الأمن (3)
    {'name': 'كاميرات', 'icon': Icons.videocam, 'color': Colors.blue},
    {'name': 'إنذار', 'icon': Icons.warning, 'color': Colors.red},
    {'name': 'أقفال', 'icon': Icons.lock, 'color': Colors.grey},

    // الموسيقى (3)
    {'name': 'آلات موسيقية', 'icon': Icons.music_note, 'color': Colors.purple},
    {'name': 'سماعات', 'icon': Icons.speaker, 'color': Colors.blue},
    {'name': 'مكبرات', 'icon': Icons.headphones, 'color': Colors.red},

    // العملات (2)
    {'name': 'عملات قديمة', 'icon': Icons.monetization_on, 'color': Colors.amber},
    {'name': 'طوابع', 'icon': Icons.markunread_mailbox, 'color': Colors.green},

    // السينما (2)
    {'name': 'أفلام', 'icon': Icons.movie, 'color': Colors.red},
    {'name': 'مسلسلات', 'icon': Icons.tv, 'color': Colors.blue},

    // السيارات الفاخرة (6)
    {'name': 'مرسيدس', 'icon': Icons.directions_car, 'color': Colors.grey},
    {'name': 'بي إم دبليو', 'icon': Icons.directions_car, 'color': Colors.blue},
    {'name': 'أودي', 'icon': Icons.directions_car, 'color': Colors.red},
    {'name': 'بورش', 'icon': Icons.directions_car, 'color': Colors.yellow},
    {'name': 'لكزس', 'icon': Icons.directions_car, 'color': Colors.grey},
    {'name': 'رنج روفر', 'icon': Icons.directions_car, 'color': Colors.green},

    // العقارات التجارية (6)
    {'name': 'محلات', 'icon': Icons.store, 'color': Colors.blue},
    {'name': 'مكاتب', 'icon': Icons.business, 'color': Colors.green},
    {'name': 'مستودعات', 'icon': Icons.warehouse, 'color': Colors.orange},
    {'name': 'معارض', 'icon': Icons.storefront, 'color': Colors.purple},
    {'name': 'مصانع', 'icon': Icons.factory, 'color': Colors.red},
    {'name': 'مطاعم', 'icon': Icons.restaurant, 'color': Colors.amber},

    // الإلكترونيات الاستهلاكية (6)
    {'name': 'تلفزيونات', 'icon': Icons.tv, 'color': Colors.blue},
    {'name': 'مشغلات صوت', 'icon': Icons.speaker, 'color': Colors.green},
    {'name': 'ريسيفرات', 'icon': Icons.satellite_alt, 'color': Colors.orange},
    {'name': 'بطاريات', 'icon': Icons.battery_std, 'color': Colors.yellow},
    {'name': 'شواحن', 'icon': Icons.battery_charging_full, 'color': Colors.purple},
    {'name': 'كابلات', 'icon': Icons.usb, 'color': Colors.grey},

    // الأثاث الفاخر (6)
    {'name': 'غرف نوم', 'icon': Icons.bed, 'color': Colors.brown},
    {'name': 'مجالس', 'icon': Icons.chair, 'color': Colors.amber},
    {'name': 'صالات', 'icon': Icons.weekend, 'color': Colors.purple},
    {'name': 'طاولات', 'icon': Icons.dining, 'color': Colors.green},
    {'name': 'مكاتب', 'icon': Icons.desk, 'color': Colors.blue},
    {'name': 'إضاءة', 'icon': Icons.light, 'color': Colors.yellow},

    // المجوهرات والساعات (6)
    {'name': 'ذهب', 'icon': Icons.star, 'color': Colors.amber},
    {'name': 'فضة', 'icon': Icons.star_border, 'color': Colors.grey},
    {'name': 'ألماس', 'icon': Icons.diamond, 'color': Colors.cyan},
    {'name': 'لؤلؤ', 'icon': Icons.brightness_1, 'color': Colors.pink},
    {'name': 'ساعات', 'icon': Icons.watch, 'color': Colors.blue},
    {'name': 'خواتم', 'icon': Icons.diamond, 'color': Colors.red},

    // العطور (6)
    {'name': 'عطور رجالية', 'icon': Icons.emoji_people, 'color': Colors.blue},
    {'name': 'عطور نسائية', 'icon': Icons.emoji_emotions, 'color': Colors.pink},
    {'name': 'عطور عربية', 'icon': Icons.spa, 'color': Colors.amber},
    {'name': 'بخور', 'icon': Icons.smoke_free, 'color': Colors.brown},
    {'name': 'دهن عود', 'icon': Icons.water_drop, 'color': Colors.grey},
    {'name': 'معطرات', 'icon': Icons.air, 'color': Colors.green},

    // الأطعمة والمشروبات (8)
    {'name': 'تمور', 'icon': Icons.date_range, 'color': Colors.brown},
    {'name': 'عسل', 'icon': Icons.water_drop, 'color': Colors.amber},
    {'name': 'قهوة', 'icon': Icons.coffee, 'color': Colors.brown},
    {'name': 'شاي', 'icon': Icons.emoji_food_beverage, 'color': Colors.green},
    {'name': 'بهارات', 'icon': Icons.grass, 'color': Colors.orange},
    {'name': 'زيوت', 'icon': Icons.opacity, 'color': Colors.yellow},
    {'name': 'حلويات', 'icon': Icons.cake, 'color': Colors.pink},
    {'name': 'مشروبات', 'icon': Icons.local_drink, 'color': Colors.red},

    // مستلزمات الأطفال (8)
    {'name': 'ملابس أطفال', 'icon': Icons.child_care, 'color': Colors.blue},
    {'name': 'حفاضات', 'icon': Icons.inventory, 'color': Colors.green},
    {'name': 'ألعاب أطفال', 'icon': Icons.toys, 'color': Colors.red},
    {'name': 'عربات', 'icon': Icons.airline_seat_recline_normal, 'color': Colors.orange},
    {'name': 'مقاعد سيارة', 'icon': Icons.car_rental, 'color': Colors.purple},
    {'name': 'رضاعة', 'icon': Icons.emoji_food_beverage, 'color': Colors.pink},
    {'name': 'أثاث أطفال', 'icon': Icons.bed, 'color': Colors.brown},
    {'name': 'هدايا مواليد', 'icon': Icons.card_giftcard, 'color': Colors.teal},

    // الحيوانات الأليفة (8)
    {'name': 'كلاب', 'icon': Icons.pets, 'color': Colors.brown},
    {'name': 'قطط', 'icon': Icons.pets, 'color': Colors.orange},
    {'name': 'طيور', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'أسماك', 'icon': Icons.set_meal, 'color': Colors.teal},
    {'name': 'أرانب', 'icon': Icons.pets, 'color': Colors.pink},
    {'name': 'أعلاف', 'icon': Icons.grass, 'color': Colors.green},
    {'name': 'مستلزمات', 'icon': Icons.shopping_bag, 'color': Colors.purple},
    {'name': 'أدوية', 'icon': Icons.local_pharmacy, 'color': Colors.red},

    // الهدايا (8)
    {'name': 'هدايا رجالية', 'icon': Icons.card_giftcard, 'color': Colors.blue},
    {'name': 'هدايا نسائية', 'icon': Icons.card_giftcard, 'color': Colors.pink},
    {'name': 'بوكسات', 'icon': Icons.inventory, 'color': Colors.purple},
    {'name': 'ورود', 'icon': Icons.local_florist, 'color': Colors.red},
    {'name': 'شوكولاتة', 'icon': Icons.cake, 'color': Colors.brown},
    {'name': 'بطاقات', 'icon': Icons.email, 'color': Colors.orange},
    {'name': 'هدايا زفاف', 'icon': Icons.favorite, 'color': Colors.pink},
    {'name': 'هدايا مولود', 'icon': Icons.child_care, 'color': Colors.blue},

    // الرياضة واللياقة (8)
    {'name': 'أدوات رياضية', 'icon': Icons.sports, 'color': Colors.blue},
    {'name': 'ملابس رياضية', 'icon': Icons.sports_handball, 'color': Colors.green},
    {'name': 'أحذية رياضية', 'icon': Icons.sports_soccer, 'color': Colors.red},
    {'name': 'مكملات', 'icon': Icons.fitness_center, 'color': Colors.orange},
    {'name': 'أجهزة لياقة', 'icon': Icons.fitness_center, 'color': Colors.purple},
    {'name': 'يوغا', 'icon': Icons.self_improvement, 'color': Colors.teal},
    {'name': 'تخسيس', 'icon': Icons.monitor_weight, 'color': Colors.brown},
    {'name': 'أندية', 'icon': Icons.sports_soccer, 'color': Colors.amber},

    // القرطاسية (8)
    {'name': 'أقلام', 'icon': Icons.edit, 'color': Colors.blue},
    {'name': 'دفاتر', 'icon': Icons.note, 'color': Colors.green},
    {'name': 'ألوان', 'icon': Icons.color_lens, 'color': Colors.red},
    {'name': 'كراسات', 'icon': Icons.book, 'color': Colors.orange},
    {'name': 'أدوات هندسية', 'icon': Icons.straighten, 'color': Colors.purple},
    {'name': 'مجلدات', 'icon': Icons.folder, 'color': Colors.brown},
    {'name': 'طابعات', 'icon': Icons.print, 'color': Colors.teal},
    {'name': 'أحبار', 'icon': Icons.opacity, 'color': Colors.amber},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'جميع الأقسام'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _allCategories.length,
        itemBuilder: (context, index) {
          final cat = _allCategories[index];
          return GestureDetector(
            onTap: () {
              // TODO: فتح صفحة القسم
            },
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: (cat['color'] as Color).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      cat['icon'] as IconData,
                      color: cat['color'] as Color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cat['name'],
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: isDark ? AppTheme.darkText : AppTheme.lightText,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
