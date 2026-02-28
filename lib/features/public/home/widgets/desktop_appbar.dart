import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../../about/about_screen.dart';
import '../../activities/what_we_do.dart';
import '../../contact/contact_screen.dart';
import '../../donate/donate_screen.dart';
import '../../impact/impact_screen.dart';
import '../../volunteer/volunteer_screen.dart';
import '../screen/home_screen.dart';


class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 64,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SvgPicture.asset(
          AppAssets.logo,
          height: 36,
          width: 36,
          fit: BoxFit.contain,
        ),
      ),
      titleSpacing: 12,
      title: const Text(
        'SopnoJoy',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
          color: AppColors.headingText,
        ),
      ),
      actions: [
        _NavItem(title: 'Home', routeName: HomeScreen.name),
        _NavItem(title: 'About Us', routeName: AboutScreen.name),
        _NavItem(title: 'What We Do', routeName: WhatWeDoScreen.name),
        _NavItem(title: 'Impact', routeName: ImpactScreen.name),
        _NavItem(title: 'Join Us', routeName: JoinUsScreen.name),
        _NavItem(title: 'Contact', routeName: ContactScreen.name),
        const SizedBox(width: 12),
        _DonateButton(),
        const SizedBox(width: 24),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isActive = currentRoute == routeName;

    return InkWell(
      borderRadius: BorderRadius.circular(6),
      hoverColor: AppColors.primaryBlue.withOpacity(0.08),
      onTap: () {
        if (!isActive) {
          Navigator.pushNamed(context, routeName);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: isActive
                  ? const Border(
                bottom: BorderSide(
                  color: AppColors.primaryBlue,
                  width: 2,
                ),
              )
                  : null,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive
                    ? AppColors.primaryBlue
                    : AppColors.bodyText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _DonateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, DonateScreen.name);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text('Donate'),
    );
  }
}

