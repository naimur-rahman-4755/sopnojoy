import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sopnojoy/core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../widgets/desktop_appbar.dart';
import '../widgets/footer_section.dart';
import '../widgets/home_hero_section.dart';
import '../widgets/impact_quote_section.dart';
import '../widgets/join_our_mission_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/our_impact_section.dart';
import '../widgets/our_mission_section.dart';
import '../widgets/our_team_section.dart';
import '../widgets/what_we_do_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const name = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;

    return Scaffold(
      appBar: isDesktop
          ? const DesktopAppBar()
          : AppBar(
        title: const Text(
          'SopnoJoy',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.headingText,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SvgPicture.asset(
            AppAssets.logo,
            height: 32,
            width: 32,
            fit: BoxFit.contain,
          ),
        ),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu,color: Colors.black,),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeHeroSection(
              heroImage: AppAssets.heroImage,
            ),
            const SizedBox(height: 40,),
            OurMissionSection(),
            const SizedBox(height: 40),
            WhatWeDoSection(),
            const SizedBox(height: 40),
            OurImpactSection(),
            const SizedBox(height: 40),
            OurTeamSection(),
            const SizedBox(height: 40),
            ImpactQuoteSection(),
            const SizedBox(height: 40),
            JoinOurMissionSection(),
            const SizedBox(height: 40),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
