import 'package:flutter/material.dart';
import '../../../../core/constacts/spacing.dart';

class WhyWeExistSection extends StatelessWidget {
  const WhyWeExistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl * 1.2,
        horizontal: AppSpacing.md,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3A7BD5), // softer blue
            Color(0xFF00B09B), // elegant green
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 900, // better reading width
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section Title
              Text(
                'Why We Exist',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              // Elegant Divider
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Body Text
              Text(
                'We exist because millions of people around the world still struggle with poverty, hunger, and lack of access to basic healthcare. We believe that every person deserves the chance to live a healthy, dignified life.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.95),
                  height: 1.8,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              Text(
                'Through grassroots action and community partnerships, we’re working to break the cycles of poverty and create opportunities for those who need them most. Our approach is holistic — addressing immediate needs while building long-term solutions.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.95),
                  height: 1.8,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              Text(
                'We’re not just an organization; we’re a movement of compassionate individuals united by the belief that together, we can create meaningful change.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  height: 1.9,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
