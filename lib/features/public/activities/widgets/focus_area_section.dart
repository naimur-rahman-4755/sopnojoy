import 'package:flutter/material.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';
import 'focus_area_card.dart';

class FocusAreasSection extends StatelessWidget {
  const FocusAreasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Column(
        children: [
          const Text('Our Focus Areas', style: AppTextStyles.h2),
          const SizedBox(height: AppSpacing.xl),
          LayoutBuilder(
            builder: (context, constraints) {
              // Determine number of columns based on width
              final width = constraints.maxWidth;
              int columns = 1;
              if (width >= 1200) {
                columns = 3;
              } else if (width >= 800) {
                columns = 2;
              }

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
                  child: GridView.builder(
                    itemCount: focusAreasData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: AppSpacing.lg,
                      mainAxisSpacing: AppSpacing.lg,
                      mainAxisExtent: null, // Let height adjust naturally
                    ),
                    itemBuilder: (context, index) {
                      final item = focusAreasData[index];
                      return FocusAreaCard(
                        icon: item.icon,
                        title: item.title,
                        items: item.items,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Model for focus area
class FocusAreaData {
  final IconData icon;
  final String title;
  final List<String> items;

  FocusAreaData({required this.icon, required this.title, required this.items});
}

// Data for the cards
final focusAreasData = [
  FocusAreaData(
    icon: Icons.favorite_border,
    title: 'No Poverty',
    items: [
      'Vocational Skills Training',
      'Microfinance Support',
      'Entrepreneurship Workshops',
      'Community Development Programs',
    ],
  ),
  FocusAreaData(
    icon: Icons.restaurant_menu,
    title: 'Zero Hunger',
    items: [
      'Weekly Food Distribution',
      'Nutrition Education',
      'Community Kitchen Programs',
      'School Meal Programs',
    ],
  ),
  FocusAreaData(
    icon: Icons.health_and_safety_outlined,
    title: 'Good Health & Well-being',
    items: [
      'Free Health Checkup Camps',
      'Mental Health Awareness',
      'Hygiene Promotion',
      'Mother & Child Health Programs',
    ],
  ),
];