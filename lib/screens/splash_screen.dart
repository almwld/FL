import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';
import 'main_navigation.dart';
import '../services/supabase_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _particleController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.elasticOut,
      ),
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _logoController.forward();

    // الانتقال بعد 3 ثواني
    Future.delayed(const Duration(seconds: 3), () {
      _navigateToNextScreen();
    });
  }

  void _navigateToNextScreen() {
    final isAuthenticated = SupabaseService.isAuthenticated;
    
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return isAuthenticated 
              ? const MainNavigation() 
              : const LoginScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: Stack(
        children: [
          // جسيمات متحركة في الخلفية
          AnimatedBuilder(
            animation: _particleController,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: ParticlePainter(
                  animation: _particleController.value,
                ),
              );
            },
          ),

          // التدرج الذهبي
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.goldColor.withOpacity(0.1),
                  Colors.transparent,
                  AppTheme.goldColor.withOpacity(0.05),
                ],
              ),
            ),
          ),

          // المحتوى الرئيسي
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الشعار
                AnimatedBuilder(
                  animation: _logoController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _logoOpacityAnimation.value,
                      child: Transform.scale(
                        scale: _logoScaleAnimation.value,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: AppTheme.goldGradient,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.goldColor.withOpacity(0.5),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.shopping_bag,
                              size: 80,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),

                // اسم التطبيق
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'FLEX',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.goldColor,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 500))
                        .slideX(begin: -0.5, end: 0),
                    const SizedBox(width: 8),
                    Text(
                      'YEMEN',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.goldLight.withOpacity(0.8),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 700))
                        .slideX(begin: 0.5, end: 0),
                  ],
                ),

                const SizedBox(height: 16),

                // الشعار الفرعي
                Text(
                  'منصة التجارة الإلكترونية اليمنية',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 900)),

                const SizedBox(height: 60),

                // مؤشر التحميل
                Container(
                  width: 200,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return AnimatedBuilder(
                        animation: _logoController,
                        builder: (context, child) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: constraints.maxWidth *
                                  _logoController.value,
                              decoration: BoxDecoration(
                                gradient: AppTheme.goldGradient,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 1000)),
              ],
            ),
          ),

          // النسخة في الأسفل
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'الإصدار 1.0.0',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double animation;

  ParticlePainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.goldColor.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final random = Random(42);
    final particleCount = 30;

    for (var i = 0; i < particleCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = (random.nextDouble() * size.height + animation * 100) % size.height;
      final radius = random.nextDouble() * 3 + 1;
      final opacity = (1 - y / size.height) * 0.5;

      paint.color = AppTheme.goldColor.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
