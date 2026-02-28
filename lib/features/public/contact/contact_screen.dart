import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sopnojoy/features/public/contact/widgets/contact_form_section.dart';
import '../../../core/constacts/color.dart';
import '../../../core/constacts/spacing.dart';
import '../../../core/constacts/text_style.dart';
import '../home/widgets/desktop_appbar.dart';
import '../home/widgets/mobile_drawer.dart';
import '../home/widgets/footer_section.dart';
import '../home/widgets/social_brand_button.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const name = '/contact';

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
        title: const Text(
          'Contact Us',
          style: AppTextStyles.h4,
        ),
      ),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _HeroSection(),
            _MainSection(),
            _OfficeHoursSection(),
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
            'Contact Us',
            style: AppTextStyles.h1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            "We'd love to hear from you. Reach out with questions, feedback, or just to say hello!",
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/* ------------------------------------------------ */
/* MAIN SECTION */
/* ------------------------------------------------ */

class _MainSection extends StatelessWidget {
  const _MainSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.xxl,
            horizontal: AppSpacing.md,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.maxContentWidth,
              ),
              child: isDesktop
                  ? const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _ContactInfoSection()),
                  SizedBox(width: AppSpacing.xl),
                  Expanded(child: ContactForm()),
                ],
              )
                  : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ContactInfoSection(),
                  SizedBox(height: AppSpacing.xl),
                  ContactForm(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/* ------------------------------------------------ */
/* CONTACT INFO */
/* ------------------------------------------------ */

class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Get in Touch',
          style: AppTextStyles.h2,
        ),
        const SizedBox(height: AppSpacing.md),
        const Text(
          'Have questions about our programs, want to volunteer, or need assistance? We\'re here to help!',
          style: AppTextStyles.bodyLarge,
        ),
        const SizedBox(height: AppSpacing.xl),

        _InfoCard(
          icon: Icons.phone,
          title: 'Phone',
          value: '+880 1XXX-XXXXXX',
        ),
        const SizedBox(height: AppSpacing.md),

        _InfoCard(
          icon: Icons.email_outlined,
          title: 'Email',
          value: 'contact@shopnojoy.org',
        ),
        const SizedBox(height: AppSpacing.md),

        _InfoCard(
          icon: Icons.location_on_outlined,
          title: 'Address',
          value: 'Dhaka, Bangladesh',
        ),

        const SizedBox(height: AppSpacing.xl),

        const Text(
          'Connect With Us',
          style: AppTextStyles.h3,
        ),
        const SizedBox(height: AppSpacing.sm),

        const Text(
          'Follow us on social media for updates, stories, and ways to get involved',
          style: AppTextStyles.body,
        ),

        const SizedBox(height: AppSpacing.md),

        Wrap(
          spacing: AppSpacing.sm,
          children: const [
            SocialBrandButton(
              icon: FontAwesomeIcons.facebookF,
              url: 'https://www.facebook.com/draculanaim',
              color: AppColors.primaryBlue,
            ),
            SocialBrandButton(
              icon: FontAwesomeIcons.instagram,
              url: 'https://www.instagram.com/draculanaim',
              color: AppColors.primaryBlue,
            ),
            SocialBrandButton(
              icon: FontAwesomeIcons.xTwitter,
              url: 'https://twitter.com/',
              color: AppColors.primaryBlue,
            ),
          ],
        ),
      ],
    );
  }
}

/* ------------------------------------------------ */
/* INFO CARD */
/* ------------------------------------------------ */

class _InfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  State<_InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<_InfoCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: _hovered ? AppColors.primaryBlue : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(
                widget.icon,
                color: AppColors.primaryBlue,
                size: 22,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: AppTextStyles.h4),
                const SizedBox(height: 2),
                Text(widget.value, style: AppTextStyles.body),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------------------------------------------ */
/* SOCIAL BUTTON */
/* ------------------------------------------------ */

class _SocialButton extends StatefulWidget {
  final IconData icon;

  const _SocialButton({required this.icon});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _hovered
              ? AppColors.primaryBlue.withOpacity(0.15)
              : AppColors.sectionBg,
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            widget.icon,
            color: AppColors.primaryBlue,
            size: 20,
          ),
        ),
      ),
    );
  }
}


/* ------------------------------------------------ */
/* OFFICE HOURS */
/* ------------------------------------------------ */

class _OfficeHoursSection extends StatelessWidget {
  const _OfficeHoursSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              'Office Hours',
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: AppSpacing.lg),

            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius:
                BorderRadius.circular(AppSpacing.radiusLg),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: const [
                  Text(
                    'Available',
                    style: AppTextStyles.h3,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Saturday - Friday',
                    style: AppTextStyles.body,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    '9:00 AM - 5:00 PM',
                    style: AppTextStyles.h4,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            const Text(
              'For emergency assistance, please contact us via WhatsApp',
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
