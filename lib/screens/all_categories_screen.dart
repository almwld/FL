import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'categories/health_beauty_screen.dart';
import 'categories/home_appliances_screen.dart';
import 'categories/kitchen_food_screen.dart';
import 'categories/handicrafts_antiques_screen.dart';
import 'categories/construction_materials_screen.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'الصحة والجمال', 'screen': HealthBeautyScreen, 'color': Colors.pink},
    {'name': 'الأجهزة المنزلية', 'screen': HomeAppliancesScreen, 'color': Colors.cyan},
    {'name': 'المطبخ والطعام', 'screen': KitchenFoodScreen, 'color': Colors.amber},
    {'name': 'الحرف والتحف', 'screen': HandicraftsAntiquesScreen, 'color': Colors.brown},
    {'name': 'مواد البناء', 'screen': ConstructionMaterialsScreen, 'color': Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'جميع الأقسام'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => cat['screen']()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: (cat['color'] as Color).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.category, color: cat['color']),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      cat['name'],
                      style: const TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
