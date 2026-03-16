import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../models/wallet_model.dart';
import 'wallet/deposit_screen.dart';
import 'wallet/transfer_screen.dart';
import 'wallet/withdraw_screen.dart';
import 'wallet/payments_screen.dart';
import 'wallet/transactions_screen.dart';
import 'wallet/transfer_network_screen.dart';
import 'wallet/entertainment_services_screen.dart';
import 'wallet/games_screen.dart';
import 'wallet/apps_screen.dart';
import 'wallet/gift_cards_screen.dart';
import 'wallet/amazon_gift_cards_screen.dart';
import 'wallet/banks_wallets_screen.dart';
import 'wallet/money_transfers_screen.dart';
import 'wallet/government_payments_screen.dart';
import 'wallet/jib_screen.dart';
import 'wallet/cash_withdrawal_screen.dart';
import 'wallet/universities_screen.dart';
import 'wallet/recharge_payment_screen.dart';
import 'wallet/recharge_credit_screen.dart';
import 'wallet/pay_bundles_screen.dart';
import 'wallet/internet_landline_screen.dart';
import 'wallet/receive_transfer_request_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _currentCardIndex = 0;
  
  // بيانات وهمية للمحفظة
  final WalletModel _wallet = WalletModel(
    userId: 'user1',
    yerBalance: 125000,
    sarBalance: 2500,
    usdBalance: 500,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final List<Map<String, dynamic>> _services = [
    {'name': 'إيداع', 'icon': Icons.add_circle, 'screen': DepositScreen(), 'color': Color(0xFF4CAF50)},
    {'name': 'تحويل', 'icon': Icons.swap_horiz, 'screen': TransferScreen(), 'color': Color(0xFF2196F3)},
    {'name': 'سحب', 'icon': Icons.remove_circle, 'screen': WithdrawScreen(), 'color': Color(0xFFF44336)},
    {'name': 'فواتير', 'icon': Icons.receipt_long, 'screen': PaymentsScreen(), 'color': Color(0xFFFF9800)},
    {'name': 'شبكة تحويل', 'icon': Icons.network_cell, 'screen': TransferNetworkScreen(), 'color': Color(0xFF9C27B0)},
    {'name': 'ترفيه', 'icon': Icons.movie, 'screen': EntertainmentServicesScreen(), 'color': Color(0xFFE91E63)},
    {'name': 'ألعاب', 'icon': Icons.games, 'screen': GamesScreen(), 'color': Color(0xFF00BCD4)},
    {'name': 'تطبيقات', 'icon': Icons.apps, 'screen': AppsScreen(), 'color': Color(0xFF3F51B5)},
    {'name': 'بطائق نت', 'icon': Icons.card_giftcard, 'screen': GiftCardsScreen(), 'color': Color(0xFFFF5722)},
    {'name': 'أمازون', 'icon': Icons.shopping_cart, 'screen': AmazonGiftCardsScreen(), 'color': Color(0xFFFF9800)},
    {'name': 'بنوك', 'icon': Icons.account_balance, 'screen': BanksWalletsScreen(), 'color': Color(0xFF607D8B)},
    {'name': 'تحويلات', 'icon': Icons.send, 'screen': MoneyTransfersScreen(), 'color': Color(0xFF795548)},
    {'name': 'حكومي', 'icon': Icons.account_balance_wallet, 'screen': GovernmentPaymentsScreen(), 'color': Color(0xFF009688)},
    {'name': 'جيب', 'icon': Icons.wallet, 'screen': JibScreen(), 'color': Color(0xFF673AB7)},
    {'name': 'سحب نقدي', 'icon': Icons.money, 'screen': CashWithdrawalScreen(), 'color': Color(0xFF8BC34A)},
    {'name': 'جامعات', 'icon': Icons.school, 'screen': UniversitiesScreen(), 'color': Color(0xFF3F51B5)},
    {'name': 'شحن وسداد', 'icon': Icons.phone_android, 'screen': RechargePaymentScreen(), 'color': Color(0xFF00BCD4)},
    {'name': 'شحن رصيد', 'icon': Icons.signal_cellular_alt, 'screen': RechargeCreditScreen(), 'color': Color(0xFF4CAF50)},
    {'name': 'سداد باقات', 'icon': Icons.data_usage, 'screen': PayBundlesScreen(), 'color': Color(0xFFFF9800)},
    {'name': 'إنترنت', 'icon': Icons.wifi, 'screen': InternetLandlineScreen(), 'color': Color(0xFF2196F3)},
    {'name': 'استلام حوالة', 'icon': Icons.download, 'screen': ReceiveTransferRequestScreen(), 'color': Color(0xFF9C27B0)},
    {'name': 'العمليات', 'icon': Icons.history, 'screen': TransactionsScreen(), 'color': Color(0xFF607D8B)},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      body: CustomScrollView(
        slivers: [
          // الشريط العلوي
          const SliverToBoxAdapter(
            child: CustomAppBar(title: 'المحفظة'),
          ),

          // المحتوى
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // بطاقات الرصيد
                _buildBalanceCards(),

                const SizedBox(height: 24),

                // شبكة الخدمات
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'الخدمات',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppTheme.darkText : AppTheme.lightText,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // شبكة الخدمات
                _buildServicesGrid(),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCards() {
    final cards = [
      _buildBalanceCard(
        'ريال يمني',
        _wallet.formattedYerBalance,
        'YER',
        const Color(0xFF4CAF50),
      ),
      _buildBalanceCard(
        'ريال سعودي',
        _wallet.formattedSarBalance,
        'SAR',
        const Color(0xFF2196F3),
      ),
      _buildBalanceCard(
        'دولار أمريكي',
        _wallet.formattedUsdBalance,
        'USD',
        const Color(0xFFFF9800),
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: cards.length,
            onPageChanged: (index) {
              setState(() {
                _currentCardIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: cards[index],
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            cards.length,
            (index) => Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentCardIndex == index
                    ? AppTheme.goldColor
                    : Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard(
    String currencyName,
    String balance,
    String currencyCode,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.goldColor,
            AppTheme.goldLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.goldColor.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // الديكور الخلفي
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            left: -20,
            bottom: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          // المحتوى
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      currencyName,
                      style: const TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  balance,
                  style: const TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currencyCode,
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.2, end: 0);
  }

  Widget _buildServicesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 12,
        ),
        itemCount: _services.length,
        itemBuilder: (context, index) {
          final service = _services[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => service['screen'] as Widget,
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: (service['color'] as Color).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    service['icon'] as IconData,
                    color: service['color'] as Color,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  service['name'] as String,
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 11,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppTheme.darkText
                        : AppTheme.lightText,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
