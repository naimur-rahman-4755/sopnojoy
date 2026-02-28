import 'package:flutter/material.dart';

import '../../../core/constacts/color.dart';
import '../../../core/constacts/spacing.dart';
import '../../../core/constacts/text_style.dart';
import '../home/widgets/desktop_appbar.dart';
import '../home/widgets/mobile_drawer.dart';
import '../home/widgets/footer_section.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  static const name = '/donate';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: isDesktop
          ? const DesktopAppBar()
          : AppBar(
        backgroundColor: AppColors.appBarBg,
        elevation: 0,
        title: const Text('Donate', style: AppTextStyles.h4),
      ),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _HeroSection(),
            _WhyDonateSection(),
            _FundUsageSection(),
            _DonationImpactSection(),
            _HowToDonateSection(),
            _ContributionCTASection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

/* ------------------------------------------------ */
/* HERO SECTION */
/* ------------------------------------------------ */

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.sectionBg,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      child: Column(
        children: const [
          Text(
            'Support Our Mission',
            style: AppTextStyles.h1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            'Your generosity transforms lives and builds hope. Every contribution, no matter the size, makes a difference.',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/* ------------------------------------------------ */
/* WHY DONATE */
/* ------------------------------------------------ */

class _WhyDonateSection extends StatelessWidget {
  const _WhyDonateSection();

  @override
  Widget build(BuildContext context) {
    return _CenteredSection(
      child: Column(
        children: [
          const Text(
            'Why Donate to Shopno Joy?',
            style: AppTextStyles.h2,
          ),
          const SizedBox(height: AppSpacing.xl),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              return isDesktop
                  ? const Row(
                children: [
                  Expanded(
                    child: _WhyCard(
                      icon: Icons.favorite_border,
                      title: 'Direct Impact',
                      text:
                      'Your donation directly helps those in need—no middlemen, no delays.',
                    ),
                  ),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: _WhyCard(
                      icon: Icons.trending_up,
                      title: 'Sustainable Change',
                      text:
                      'We create long-term solutions that empower communities to thrive.',
                    ),
                  ),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: _WhyCard(
                      icon: Icons.verified_user_outlined,
                      title: 'Full Transparency',
                      text:
                      'Every penny is accounted for with regular impact reports.',
                    ),
                  ),
                ],
              )
                  : const Column(
                children: [
                  _WhyCard(
                    icon: Icons.favorite_border,
                    title: 'Direct Impact',
                    text:
                    'Your donation directly helps those in need—no middlemen, no delays.',
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _WhyCard(
                    icon: Icons.trending_up,
                    title: 'Sustainable Change',
                    text:
                    'We create long-term solutions that empower communities to thrive.',
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _WhyCard(
                    icon: Icons.verified_user_outlined,
                    title: 'Full Transparency',
                    text:
                    'Every penny is accounted for with regular impact reports.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _WhyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _WhyCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 36, color: AppColors.primaryBlue),
        const SizedBox(height: AppSpacing.md),
        Text(title, style: AppTextStyles.h4),
        const SizedBox(height: AppSpacing.sm),
        Text(
          text,
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/* ------------------------------------------------ */
/* FUND USAGE */
/* ------------------------------------------------ */

class _FundUsageSection extends StatelessWidget {
  const _FundUsageSection();

  @override
  Widget build(BuildContext context) {
    return _CenteredSection(
      child: Column(
        children: [
          const Text(
            'How Your Funds Are Used',
            style: AppTextStyles.h2,
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'We believe in complete transparency. Here’s exactly how we allocate your donations:',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              return isDesktop
                  ? const Row(
                children: [
                  Expanded(
                    child: _FundCard(
                      percent: '70%',
                      title: 'Program Activities',
                      text:
                      'Direct service delivery and community programs',
                    ),
                  ),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: _FundCard(
                      percent: '20%',
                      title: 'Administrative',
                      text:
                      'Operational costs and volunteer support',
                    ),
                  ),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: _FundCard(
                      percent: '10%',
                      title: 'Future Projects',
                      text: 'Expanding our reach and impact',
                    ),
                  ),
                ],
              )
                  : const Column(
                children: [
                  _FundCard(
                    percent: '70%',
                    title: 'Program Activities',
                    text:
                    'Direct service delivery and community programs',
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _FundCard(
                    percent: '20%',
                    title: 'Administrative',
                    text:
                    'Operational costs and volunteer support',
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _FundCard(
                    percent: '10%',
                    title: 'Future Projects',
                    text: 'Expanding our reach and impact',
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.sectionBg,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: const Text(
              'Note: Shopno Joy is committed to responsible financial management. We publish quarterly impact reports showing exactly how funds are utilized.',
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _FundCard extends StatelessWidget {
  final String percent;
  final String title;
  final String text;

  const _FundCard({
    required this.percent,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            percent,
            style: AppTextStyles.h1.copyWith(color: AppColors.primaryBlue),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(title, style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.sm),
          Text(text, style: AppTextStyles.body),
        ],
      ),
    );
  }
}

/* ------------------------------------------------ */
/* DONATION IMPACT */
/* ------------------------------------------------ */

class _DonationImpactSection extends StatelessWidget {
  const _DonationImpactSection();

  @override
  Widget build(BuildContext context) {
    return _CenteredSection(
      child: Column(
        children: [
          const Text(
            'Your Donation Impact',
            style: AppTextStyles.h2,
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'See how different donation amounts create real change',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppSpacing.xl),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              final cards = const [
                _ImpactCard(
                  amount: '৳500',
                  text: 'Provides 5 nutritious meals',
                ),
                _ImpactCard(
                  amount: '৳1,000',
                  text: 'Supports a health checkup',
                ),
                _ImpactCard(
                  amount: '৳3,000',
                  text: 'Funds a skills training session',
                ),
                _ImpactCard(
                  amount: '৳5,000+',
                  text: 'Sponsors a community program',
                ),
              ];

              return isDesktop
                  ? Row(
                children: cards
                    .map(
                      (c) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm),
                      child: c,
                    ),
                  ),
                )
                    .toList(),
              )
                  : Column(
                children: cards
                    .map(
                      (c) => Padding(
                    padding: const EdgeInsets.only(
                        bottom: AppSpacing.lg),
                    child: c,
                  ),
                )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ImpactCard extends StatefulWidget {
  final String amount;
  final String text;

  const _ImpactCard({
    required this.amount,
    required this.text,
  });

  @override
  State<_ImpactCard> createState() => _ImpactCardState();
}

class _ImpactCardState extends State<_ImpactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(
            color:
            _hovered ? AppColors.primaryBlue : AppColors.border,
          ),
        ),
        child: Column(
          children: [
            Text(
              widget.amount,
              style: AppTextStyles.h3
                  .copyWith(color: AppColors.primaryBlue),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              widget.text,
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------------------------------------------ */
/* HOW TO DONATE */
/* ------------------------------------------------ */

class _HowToDonateSection extends StatelessWidget {
  const _HowToDonateSection();

  @override
  Widget build(BuildContext context) {
    return _CenteredSection(
      child: Column(
        children: [
          const Text(
            'How to Donate',
            style: AppTextStyles.h2,
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Choose your preferred payment method and make your contribution today',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              return isDesktop
                  ? const Row(
                children: [
                  Expanded(
                    child: _PaymentCard(
                      title: 'bKash',
                      line1: 'Personal: 01XXX-XXXXXX',
                      line2:
                      'Send Money → Enter number → Complete payment',
                    ),
                  ),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: _PaymentCard(
                      title: 'Nagad',
                      line1: 'Personal: 01XXX-XXXXXX',
                      line2:
                      'Send Money → Enter number → Complete payment',
                    ),
                  ),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: _PaymentCard(
                      title: 'Bank Transfer',
                      line1: 'Bank: [Bank Name]',
                      line2:
                      'Account: XXXX-XXXX-XXXX | Branch: [Branch Name]',
                    ),
                  ),
                ],
              )
                  : const Column(
                children: [
                  _PaymentCard(
                    title: 'bKash',
                    line1: 'Personal: 01XXX-XXXXXX',
                    line2:
                    'Send Money → Enter number → Complete payment',
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _PaymentCard(
                    title: 'Nagad',
                    line1: 'Personal: 01XXX-XXXXXX',
                    line2:
                    'Send Money → Enter number → Complete payment',
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _PaymentCard(
                    title: 'Bank Transfer',
                    line1: 'Bank: [Bank Name]',
                    line2:
                    'Account: XXXX-XXXX-XXXX | Branch: [Branch Name]',
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.sectionBg,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(color: AppColors.secondaryOrange),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Important Note', style: AppTextStyles.h4),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'After making your donation, please send us a screenshot or transaction ID via WhatsApp or email so we can properly acknowledge your contribution and send you a receipt.',
                  style: AppTextStyles.body,
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'Privacy Notice: Shopno Joy is not designed for collecting personally identifiable information (PII) or securing sensitive data. We recommend not sharing sensitive personal details through donation channels.',
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  final String title;
  final String line1;
  final String line2;

  const _PaymentCard({
    required this.title,
    required this.line1,
    required this.line2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.sm),
          Text(line1, style: AppTextStyles.body),
          const SizedBox(height: AppSpacing.xs),
          Text(line2, style: AppTextStyles.body),
        ],
      ),
    );
  }
}

/* ------------------------------------------------ */
/* CTA */
/* ------------------------------------------------ */

class _ContributionCTASection extends StatelessWidget {
  const _ContributionCTASection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4F8BD6),
            Color(0xFF6BBF6B),
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Every Contribution Counts',
            style: AppTextStyles.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Whether it’s ৳100 or ৳10,000, your donation creates ripples of positive change. Together, we can build a world where no one is left behind.',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: const Column(
              children: [
                Text(
                  '"The best way to find yourself is to lose yourself in the service of others."',
                  style: AppTextStyles.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  '- Mahatma Gandhi',
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------------------------ */
/* CENTERED SECTION */
/* ------------------------------------------------ */

class _CenteredSection extends StatelessWidget {
  final Widget child;

  const _CenteredSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
          const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
