import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class AdminTopBar extends StatelessWidget {
  final String currentRoute;
  final VoidCallback? onMenuTap;
  final bool isDesktop;

  const AdminTopBar({
    super.key,
    required this.currentRoute,
    this.onMenuTap,
    required this.isDesktop,
  });

  String get _title {
    switch (currentRoute) {
      case '/admin/dashboard':
        return 'Dashboard';
      case '/admin/events':
        return 'Events';
      case '/admin/notices':
        return 'Notices';
      case '/admin/settings':
        return 'Settings';
      default:
        return 'Admin';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding:
      const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      decoration: const BoxDecoration(
        color: AppColors.cardBg,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () =>
                  Scaffold.of(context).openDrawer(),
            ),

          if (isDesktop)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onMenuTap,
            ),

          const SizedBox(width: AppSpacing.md),

          Text(
            _title,
            style: AppTextStyles.pageTitle,
          ),

          const Spacer(),

          PopupMenuButton<int>(
            offset: const Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(AppSpacing.radiusMd),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('Profile'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Logout'),
              ),
            ],
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "A",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: AppSpacing.sm),
                Text("Admin User",
                    style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}