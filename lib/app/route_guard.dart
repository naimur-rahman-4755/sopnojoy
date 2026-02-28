import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/admin/auth/presentation/auth_controller.dart';
import 'admin_routes.dart';

class RouteGuard extends ConsumerWidget {
  final Widget child;
  final String currentRoute;

  const RouteGuard({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return authState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const Scaffold(
        body: Center(child: Text("Session Error")),
      ),
      data: (isLoggedIn) {
        final isLoginRoute = currentRoute == AdminRoutes.login;

        // 🚀 Not logged in → redirect to login
        if (!isLoggedIn && !isLoginRoute) {
          Future.microtask(() {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AdminRoutes.login,
                  (route) => false,
            );
          });
          return const SizedBox.shrink();
        }

        // 🚀 Logged in but trying to access login page
        if (isLoggedIn && isLoginRoute) {
          Future.microtask(() {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AdminRoutes.dashboard,
                  (route) => false,
            );
          });
          return const SizedBox.shrink();
        }

        return child;
      },
    );
  }
}