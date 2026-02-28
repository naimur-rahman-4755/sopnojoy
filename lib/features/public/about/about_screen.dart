import 'package:flutter/material.dart';
import 'package:sopnojoy/features/public/about/widgets/about_hero_section.dart';
import 'package:sopnojoy/features/public/about/widgets/value_section.dart';
import 'package:sopnojoy/features/public/about/widgets/vision_section.dart';
import 'package:sopnojoy/features/public/about/widgets/who_we_are_section.dart';
import 'package:sopnojoy/features/public/about/widgets/why_we_exists_section.dart';

import '../../../core/constacts/color.dart';
import '../home/widgets/desktop_appbar.dart';
import '../home/widgets/footer_section.dart';
import '../home/widgets/mobile_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const name = '/about';

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: isDesktop
          ? const DesktopAppBar()
          : AppBar(
        backgroundColor: AppColors.appBarBg,
        foregroundColor: AppColors.headingText,
        elevation: 0,
        title: const Text('Shopno Joy'),
      ),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              AboutHeroSection(),
              WhoWeAreSection(),
              VisionSection(),
              ValuesSection(),
              WhyWeExistSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
