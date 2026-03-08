import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/admin_routes.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../auth/presentation/auth_controller.dart';
import 'sidebar_item.dart';

class AdminSidebar extends ConsumerWidget {
  final bool collapsed;
  final bool isMobile;
  final String currentRoute;

  const AdminSidebar({
    super.key,
    required this.collapsed,
    required this.currentRoute,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = collapsed ? 80.0 : AppSpacing.sidebarWidth;

    Future<void> handleLogout() async {
      await ref.read(authControllerProvider.notifier).logout();
      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        AdminRoutes.login,
            (route) => false,
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      width: isMobile ? double.infinity : width,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.xl),

          if (!collapsed)
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ShopnoJoy Admin",
                  style: AppTextStyles.sidebarTitle,
                ),
              ),
            ),

          const SizedBox(height: AppSpacing.xl),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SidebarItem(
                    icon: Icons.dashboard_outlined,
                    label: "Dashboard",
                    route: AdminRoutes.dashboard,
                    isActive:
                    currentRoute == AdminRoutes.dashboard,
                    collapsed: collapsed,
                  ),
                  SidebarItem(
                    icon: Icons.notifications_outlined,
                    label: "Notices",
                    route: AdminRoutes.notices,
                    isActive:
                    currentRoute == AdminRoutes.notices,
                    collapsed: collapsed,
                  ),
                  SidebarItem(
                    icon: Icons.message,
                    label: "Messages",
                    route: AdminRoutes.messages,
                    isActive:
                    currentRoute == AdminRoutes.messages,
                    collapsed: collapsed,
                  ),
                  SidebarItem(
                    icon: Icons.volunteer_activism_rounded,
                    label: "Impact",
                    route: AdminRoutes.impact,
                    isActive:
                    currentRoute == AdminRoutes.impact,
                    collapsed: collapsed,
                  ),
                  SidebarItem(
                    icon: Icons.volunteer_activism,
                    label: "Volunteer",
                    route: AdminRoutes.volunteer,
                    isActive:
                    currentRoute == AdminRoutes.volunteer,
                    collapsed: collapsed,
                  ),
                  SidebarItem(
                    icon: Icons.image_outlined,
                    label: "Gallery",
                    route: AdminRoutes.gallery,
                    isActive:
                    currentRoute == AdminRoutes.gallery,
                    collapsed: collapsed,
                  ),
                  SidebarItem(
                    icon: Icons.event_outlined,
                    label: "Events",
                    route: AdminRoutes.events,
                    isActive:
                    currentRoute == AdminRoutes.events,
                    collapsed: collapsed,
                  ),
                  SidebarItem(
                    icon: Icons.settings_outlined,
                    label: "Settings",
                    route: AdminRoutes.settings,
                    isActive:
                    currentRoute == AdminRoutes.settings,
                    collapsed: collapsed,
                  ),
                ],
              ),
            ),
          ),

          const Divider(color: Colors.white24),

          SidebarItem(
            icon: Icons.logout,
            label: "Logout",
            route: AdminRoutes.login,
            isActive: false,
            collapsed: collapsed,
            onTap: handleLogout,
          ),

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}