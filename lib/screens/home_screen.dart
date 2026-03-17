import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlide = 0;

  final List<Map<String, dynamic>> _slides = [
    {
      'title': 'إعلانات حصرية للتجار',
      'subtitle': 'احصل على أفضل العروض التجارية',
      'color': Colors.purple,
      'icon': Icons.business,
      'gradient': [Colors.purple, Colors.deepPurple],
    },
    {
      'title': 'VIP عروض',
      'subtitle': 'عروض خاصة للأعضاء المميزين',
      'color': Colors.amber,
      'icon': Icons.star,
      'gradient': [Colors.amber, Colors.orange],
    },
    {
      'title': 'عروض أفضل المطاعم',
      'subtitle': 'اكتشف أشهى المأكولات',
      'color': Colors.red,
      'icon': Icons.restaurant,
      'gradient': [Colors.red, Colors.redAccent],
    },
    {
      'title': 'مزادات السيارات والعقارات',
      'subtitle': 'الجنابي والأشياء الثمينة',
      'color': Colors.blue,
      'icon': Icons.directions_car,
      'gradient': [Colors.blue, Colors.blueAccent],
    },
    {
      'title': 'إعلانات المنصة',
      'subtitle': 'تابع آخر أخبار وإعلاناتنا',
      'color': Colors.green,
      'icon': Icons.campaign,
      'gradient': [Colors.green, Colors.teal],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 8),
                // السلايدر المتحرك
                CarouselSlider.builder(
                  itemCount: _slides.length,
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    viewportFraction: 0.85,
                    onPageChanged: (index, reason) {
                      setState(() => _currentSlide = index);
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final slide = _slides[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          colors: slide['gradient'],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: slide['color'].withOpacity(0.5),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // خلفية زخرفية
                          Positioned(
                            right: -20,
                            bottom: -20,
                            child: Icon(
                              slide['icon'],
                              size: 120,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          // المحتوى
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'عرض خاص',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 12,
                                      fontFamily: 'Changa',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  slide['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Changa',
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  slide['subtitle'],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 14,
                                    fontFamily: 'Changa',
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(
                      duration: 600.ms,
                      delay: (index * 100).ms,
                    );
                  },
                ),
                const SizedBox(height: 16),
                // نقاط السلايدر
                AnimatedSmoothIndicator(
                  activeIndex: _currentSlide,
                  count: _slides.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppTheme.goldColor,
                    dotColor: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 3,
                    spacing: 8,
                  ),
                ),
              ],
            ),
          ),
          // باقي محتوى الصفحة الرئيسية...
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مزيد من ما تريد',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Changa',
                      color: isDark ? AppTheme.darkText : AppTheme.lightText,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'المزيد',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: AppTheme.goldColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final List<Map<String, dynamic>> categories = [
                    {'name': 'معلمات', 'icon': Icons.settings_input_component},
                    {'name': 'عقارات', 'icon': Icons.home},
                    {'name': 'سفر', 'icon': Icons.flight},
                    {'name': 'شحن', 'icon': Icons.local_shipping},
                    {'name': 'ألعاب', 'icon': Icons.sports_esports},
                  ];
                  return Container(
                    width: 70,
                    margin: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            categories[index]['icon'],
                            color: AppTheme.goldColor,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Changa',
                            color: isDark ? AppTheme.darkText : AppTheme.lightText,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
