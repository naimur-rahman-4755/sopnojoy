import 'package:flutter/material.dart';
import '../features/public/home/screen/home_screen.dart';
import '../features/public/about/about_screen.dart';
import '../features/public/activities/what_we_do.dart';
import '../features/public/contact/contact_screen.dart';
import '../features/public/donate/donate_screen.dart';
import '../features/public/impact/impact_screen.dart';
import '../features/public/volunteer/volunteer_screen.dart';

import '../features/admin/auth/presentation/login_screen.dart';
import '../features/admin/dashboard/dashboard_screen.dart';

import 'admin_routes.dart';
import 'public_routes.dart';
import 'route_guard.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final name = settings.name ?? '/';

    // =============================
    // PUBLIC ROUTES
    // =============================
    switch (name) {
      case PublicRoutes.home:
        return _page(const HomeScreen());

      case PublicRoutes.about:
        return _page(const AboutScreen());

      case PublicRoutes.activities:
        return _page(const WhatWeDoScreen());

      case PublicRoutes.contact:
        return _page(const ContactScreen());

      case PublicRoutes.donate:
        return _page(const DonateScreen());

      case PublicRoutes.impact:
        return _page(const ImpactScreen());

      case PublicRoutes.volunteer:
        return _page(const JoinUsScreen());

    // ==============================
    // ADMIN ROUTES
    // ==============================
      case AdminRoutes.root:
      case AdminRoutes.login:
        return _page(
          RouteGuard(
            currentRoute: AdminRoutes.login,
            child: const AdminLoginScreen(),
          ),
        );

      case AdminRoutes.dashboard:
        return _page(
          RouteGuard(
            currentRoute: AdminRoutes.dashboard,
            child: const DashboardScreen(),
          ),
        );

      default:
        return _page(
          const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }

  static MaterialPageRoute _page(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}