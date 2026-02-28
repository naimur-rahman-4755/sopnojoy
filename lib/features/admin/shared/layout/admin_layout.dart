import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../widgets/admin_sidebar.dart';
import 'admin_topbar.dart';

class AdminLayout extends StatefulWidget {
  final Widget child;
  final String currentRoute;

  const AdminLayout({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  static const _breakpoint = 900;
  bool _collapsed = false;

  void _toggleSidebar() {
    setState(() => _collapsed = !_collapsed);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= _breakpoint;

    if (isDesktop) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        body: Row(
          children: [
            AdminSidebar(
              collapsed: _collapsed,
              currentRoute: widget.currentRoute,
            ),
            Expanded(
              child: Column(
                children: [
                  AdminTopBar(
                    currentRoute: widget.currentRoute,
                    onMenuTap: _toggleSidebar,
                    isDesktop: true,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // ---------------- MOBILE ----------------

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppSpacing.radiusLg),
            bottomRight: Radius.circular(AppSpacing.radiusLg),
          ),
        ),
        child: AdminSidebar(
          collapsed: false,
          currentRoute: widget.currentRoute,
          isMobile: true,
        ),
      ),
      body: Column(
        children: [
          AdminTopBar(
            currentRoute: widget.currentRoute,
            isDesktop: false,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}