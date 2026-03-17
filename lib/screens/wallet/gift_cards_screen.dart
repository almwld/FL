import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class GiftCardsScreen extends StatelessWidget {
  const GiftCardsScreen({super.key});

  final List<Map<String, dynamic>> _cards = const [
    {'name': 'جوجل بلاي', 'icon': Icons.android, 'color': Colors.green},
    {'name': 'آيتونز', 'icon': Icons.apple, 'color': Colors.grey},
    {'name': 'ستيم', 'icon': Icons.computer, 'color': Colors.blue},
    {'name': 'بلاي ستيشن', 'icon': Icons.games, 'color': Colors.indigo},
    {'name': 'اكس بوكس', 'icon': Icons.videogame_asset, 'color': Colors.green},
    {'name': 'نون', 'icon': Icons.shopping_cart, 'color': Colors.yellow},
    {'name': 'أمازون', 'icon': Icons.shopping_bag, 'color': Colors.orange},
    {'name': 'فيزا', 'icon': Icons.credit_card, 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: const CustomAppBar(title: 'بطائق نت'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final card = _cards[index];
          return Container(
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: (card['color'] as Color).withOpacity(0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(card['icon'] as IconData, color: card['color'], size: 32),
                const SizedBox(height: 8),
                Text(card['name'], style: const TextStyle(fontFamily: 'Changa', fontSize: 11), textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );
  }
}
