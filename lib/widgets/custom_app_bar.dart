import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final bool centerTitle;
  final double elevation;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.leading,
    this.centerTitle = true,
    this.elevation = 0,
    this.backgroundColor,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
      backgroundColor: backgroundColor ?? 
          (isDark ? AppTheme.darkSurface : AppTheme.lightSurface),
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: leading ?? (showBackButton && Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null),
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontFamily: 'Changa',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'FLEX',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppTheme.goldColor,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'YEMEN',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: isDark ? AppTheme.goldLight : AppTheme.goldDark,
                  ),
                ),
              ],
            ),
      actions: actions ?? [
        IconButton(
          icon: Icon(
            Icons.search,
            color: isDark ? AppTheme.darkText : AppTheme.lightText,
          ),
          onPressed: () {
            // TODO: Navigate to search
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: isDark ? AppTheme.darkText : AppTheme.lightText,
          ),
          onPressed: () {
            // TODO: Navigate to notifications
          },
        ),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );
}

class CustomSliverAppBar extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final bool centerTitle;
  final double expandedHeight;
  final Widget? flexibleSpace;
  final bool pinned;
  final bool floating;

  const CustomSliverAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.leading,
    this.centerTitle = true,
    this.expandedHeight = 200,
    this.flexibleSpace,
    this.pinned = true,
    this.floating = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
      backgroundColor: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: leading ?? (showBackButton && Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null),
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontFamily: 'Changa',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: isDark ? AppTheme.darkText : AppTheme.lightText,
              ),
            )
          : null,
      actions: actions,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
      pinned: pinned,
      floating: floating,
    );
  }
}
