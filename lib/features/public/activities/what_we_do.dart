import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sopnojoy/features/public/activities/widgets/focus_area_section.dart';
import 'package:sopnojoy/features/public/activities/widgets/program_section.dart';
import 'package:sopnojoy/features/public/activities/widgets/upcoming%20_event_section.dart';
import 'package:sopnojoy/features/public/activities/widgets/what_we_do_hero_section.dart';

import '../../../../core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../home/widgets/desktop_appbar.dart';
import '../home/widgets/footer_section.dart';
import '../home/widgets/mobile_drawer.dart';

class WhatWeDoScreen extends StatelessWidget {
  const WhatWeDoScreen({super.key});

  static const name = '/what-we-do';

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
        foregroundColor: AppColors.headingText,
        elevation: 0,
        title: const Text(
          'SopnoJoy',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SvgPicture.asset(
            AppAssets.logo,
            height: 32,
            width: 32,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            WhatWeDoHeroSection(),
            FocusAreasSection(),
            ProgramsSection(),
            UpcomingEventsSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
