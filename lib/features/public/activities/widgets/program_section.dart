import 'package:flutter/material.dart';
import '../../../../../core/constacts/assets.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';
import 'program_block.dart';

class ProgramsSection extends StatelessWidget {
  const ProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Column(
        children: const [
          Text('Our Programs', style: AppTextStyles.h2),
          SizedBox(height: AppSpacing.xl),
          ProgramBlock(
            image: AppAssets.heroImage,
            title: 'Food Distribution',
            description:
            'Every week, we organize food distribution drives in underserved communities.',
            impact: 'Over 50,000 meals distributed annually',
            imageLeft: true,
          ),
          ProgramBlock(
            image: AppAssets.heroImage,
            title: 'Health Camps',
            description:
            'Free medical checkups, consultations, and medicine distribution.',
            impact: '200+ camps reaching 10,000+ people',
            imageLeft: false,
          ),
          ProgramBlock(
            image: AppAssets.heroImage,
            title: 'Education Support',
            description:
            'Providing tutoring and mentorship to disadvantaged students.',
            impact: 'Supporting 500+ students annually',
            imageLeft: true,
          ),
          ProgramBlock(
            image: AppAssets.heroImage,
            title: 'Emergency Relief',
            description:
            'Rapid response to disasters providing food, shelter, and aid.',
            impact: 'Responded to 25+ emergencies',
            imageLeft: false,
          ),
        ],
      ),
    );
  }
}
