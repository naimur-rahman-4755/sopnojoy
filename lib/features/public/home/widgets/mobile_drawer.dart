import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sopnojoy/core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../../about/about_screen.dart';
import '../../activities/what_we_do.dart';
import '../../contact/contact_screen.dart';
import '../../donate/donate_screen.dart';
import '../../impact/impact_screen.dart';
import '../../volunteer/volunteer_screen.dart';
import '../screen/home_screen.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DrawerHeader(),
            const SizedBox(height: 12),
            _DrawerItem(title: 'Home', routeName: HomeScreen.name),
            _DrawerItem(title: 'About Us', routeName: AboutScreen.name),
            _DrawerItem(title: 'What We Do', routeName: WhatWeDoScreen.name),
            _DrawerItem(title: 'Impact', routeName: ImpactScreen.name),
            _DrawerItem(title: 'Join Us', routeName: JoinUsScreen.name),
            _DrawerItem(title: 'Contact', routeName: ContactScreen.name),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _DonateButton(),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- HEADER ---------------- */

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AppAssets.logo,
        height: 48,
        fit: BoxFit.contain,
      ),
    );
  }
}


class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isActive = currentRoute == routeName;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryBlue.withOpacity(0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive
                ? AppColors.primaryBlue
                : AppColors.bodyText,
          ),
        ),
        onTap: () {
          Navigator.pop(context);

          if (!isActive) {
            Navigator.pushNamed(context, routeName);
          }
        },
      ),
    );
  }
}



class _DonateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, DonateScreen.name);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Donate',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
