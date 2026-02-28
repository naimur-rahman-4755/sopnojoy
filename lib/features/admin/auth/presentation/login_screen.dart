import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../app/admin_routes.dart';
import 'auth_controller.dart';

class AdminLoginScreen extends ConsumerStatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  ConsumerState<AdminLoginScreen> createState() =>
      _AdminLoginScreenState();
}

class _AdminLoginScreenState
    extends ConsumerState<AdminLoginScreen>
    with SingleTickerProviderStateMixin {
  final _username = TextEditingController();
  final _specialId = TextEditingController();
  final _password = TextEditingController();

  bool obscure = true;
  String? error;

  Future<void> _login() async {
    setState(() => error = null);

    final success =
    await ref.read(authControllerProvider.notifier).login(
      username: _username.text.trim(),
      specialId: _specialId.text.trim(),
      password: _password.text.trim(),
    );

    if (!mounted) return;

    if (success) {
      Navigator.pushReplacementNamed(
          context, AdminRoutes.dashboard);
    } else {
      setState(() => error = "Invalid credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundLayer(),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: _GlassCard(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _HeaderSection(),
                      const SizedBox(height: AppSpacing.xl),
                      _StyledInput(
                        controller: _username,
                        label: "Username",
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      _StyledInput(
                        controller: _specialId,
                        label: "Special ID",
                        icon: Icons.verified_user_outlined,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      _StyledInput(
                        controller: _password,
                        label: "Password",
                        icon: Icons.lock_outline,
                        obscureText: obscure,
                        suffix: IconButton(
                          icon: Icon(
                            obscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                          ),
                          onPressed: () =>
                              setState(() => obscure = !obscure),
                        ),
                      ),
                      if (error != null) ...[
                        const SizedBox(height: AppSpacing.md),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            error!,
                            key: ValueKey(error),
                            style: const TextStyle(
                                color: AppColors.error),
                          ),
                        ),
                      ],
                      const SizedBox(height: AppSpacing.xl),
                      _LoginButton(
                        isLoading: state.isLoading,
                        onPressed:
                        state.isLoading ? null : _login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundLayer extends StatelessWidget {
  const _BackgroundLayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F2027),
            Color(0xFF203A43),
            Color(0xFF2C5364),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;

  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(AppSpacing.radiusLg),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius:
            BorderRadius.circular(AppSpacing.radiusLg),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 30,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Icon(Icons.admin_panel_settings,
            size: 48, color: AppColors.primary),
        SizedBox(height: 12),
        Text("ShopnoJoy Admin",
            style: AppTextStyles.h3),
        SizedBox(height: 4),
        Text(
          "Secure Dashboard Access",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 14),
        ),
      ],
    );
  }
}

class _StyledInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final Widget? suffix;

  const _StyledInput({
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(
              color: AppColors.primary, width: 1.2),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const _LoginButton({
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(AppSpacing.radiusMd),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: isLoading
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : const Text(
          "Login",
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}