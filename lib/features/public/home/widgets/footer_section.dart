import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:sopnojoy/features/public/home/widgets/social_brand_button.dart';
import '../../../../core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../about/about_screen.dart';
import '../../activities/what_we_do.dart';
import '../../contact/contact_screen.dart';
import '../../donate/donate_screen.dart';
import '../../impact/impact_screen.dart';
import '../../volunteer/volunteer_screen.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.footerBg,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Column(
            children: const [
              _FooterTop(),
              SizedBox(height: AppSpacing.lg),
              Divider(color: Colors.white12),
              SizedBox(height: AppSpacing.md),
              _FooterBottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterTop extends StatelessWidget {
  const _FooterTop();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return isDesktop
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(flex: 2, child: _BrandColumn()),
            Expanded(child: _LinksColumn()),
            Expanded(child: _InvolvedColumn()),
            Expanded(child: _ContactColumn()),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _BrandColumn(),
            SizedBox(height: AppSpacing.lg),
            _LinksColumn(),
            SizedBox(height: AppSpacing.lg),
            _InvolvedColumn(),
            SizedBox(height: AppSpacing.lg),
            _ContactColumn(),
          ],
        );
      },
    );
  }
}

class _BrandColumn extends StatelessWidget {
  const _BrandColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        SizedBox(
          height: 52,
          child: Image.asset(
            AppAssets.logo2,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Tagline
        Text(
          'Shopno Joy',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        // Description
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Text(
            'Turning dreams into hope by empowering communities through compassion, action, and sustainable change.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
              height: 1.65,
            ),
          ),
        ),
      ],
    );
  }
}


class _FooterTitle extends StatelessWidget {
  final String title;
  const _FooterTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LinksColumn extends StatelessWidget {
  const _LinksColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FooterTitle('Quick Links'),
        FooterLinkButton(
          text: 'About Us',
          routeName: AboutScreen.name,
        ),
        FooterLinkButton(
          text: 'What We Do',
          routeName: WhatWeDoScreen.name,
        ),
        FooterLinkButton(
          text: 'Impact',
          routeName: ImpactScreen.name,
        ),
        FooterLinkButton(
          text: 'Join Us',
          routeName: JoinUsScreen.name,
        ),
      ],
    );
  }
}


class _InvolvedColumn extends StatelessWidget {
  const _InvolvedColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _FooterTitle('Get Involved'),
        FooterLinkButton(
          text: 'Become a Volunteer',
          routeName: JoinUsScreen.name,
        ),
        FooterLinkButton(
          text: 'Make a Donation',
          routeName: DonateScreen.name,
        ),
        FooterLinkButton(
          text: 'Contact Us',
          routeName: ContactScreen.name,
        ),
      ],
    );
  }
}

class FooterLinkButton extends StatefulWidget {
  final String text;
  final String routeName;
  const FooterLinkButton({super.key, required this.text, required this.routeName});

  @override
  State<FooterLinkButton> createState() => _FooterLinkButtonState();
}

class _FooterLinkButtonState extends State<FooterLinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _hovered ? Colors.white : Colors.white70;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, widget.routeName);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          overlayColor: Colors.transparent,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovered ? Colors.white54 : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactColumn extends StatelessWidget {
  const _ContactColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FooterTitle('Contact'),
        FooterContactRow(
          icon: Icons.phone,
          label: '+880 1608-134755',
        ),
        FooterContactRow(
          icon: Icons.email,
          label: 'contact@shopnojoy.org',
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          children: const [
            SocialBrandButton(
              icon: FontAwesomeIcons.facebookF,
              url: 'https://www.facebook.com/draculanaim',
            ),
            SocialBrandButton(
              icon: FontAwesomeIcons.instagram,
              url: 'https://www.instagram.com/draculanaim',
            ),
            SocialBrandButton(
              icon: FontAwesomeIcons.xTwitter,
              url: 'https://twitter.com/',
            ),
          ],
        ),


      ],
    );
  }
}


class FooterContactRow extends StatefulWidget {
  final IconData icon;
  final String label;

  const FooterContactRow({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  State<FooterContactRow> createState() => _FooterContactRowState();
}

class _FooterContactRowState extends State<FooterContactRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = _hovered ? Colors.white : Colors.white70;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 18,
            color: Colors.white70,
          ),
          const SizedBox(width: AppSpacing.sm),


          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _hovered = true),
            onExit: (_) => setState(() => _hovered = false),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                overlayColor: Colors.transparent,
                alignment: Alignment.centerLeft,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _hovered
                          ? Colors.white54
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
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

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  const SocialIconButton({super.key, required this.icon});

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _hovered ? Colors.white24 : Colors.white10,
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(widget.icon, size: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class _FooterBottom extends StatelessWidget {
  const _FooterBottom();

  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2026 Shopno Joy. All rights reserved. Made with ❤️ for humanity.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.white60,
      ),
    );
  }
}
