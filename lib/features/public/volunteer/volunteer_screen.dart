import 'package:flutter/material.dart';
import 'package:sopnojoy/features/public/volunteer/widgets/hero_section.dart';
import 'package:sopnojoy/features/public/volunteer/widgets/volunteer_form_section.dart';
import 'package:sopnojoy/features/public/volunteer/widgets/volunteer_role_section.dart';
import 'package:sopnojoy/features/public/volunteer/widgets/why_volunteer_section.dart';

import '../../../core/constacts/color.dart';
import '../../../core/constacts/spacing.dart';
import '../../../core/constacts/text_style.dart';
import '../home/widgets/desktop_appbar.dart';
import '../home/widgets/footer_section.dart';
import '../home/widgets/mobile_drawer.dart';

class JoinUsScreen extends StatefulWidget {
  const JoinUsScreen({super.key});
  static const name = '/volunteer';

  @override
  State<JoinUsScreen> createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedInterest;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          appBar: isDesktop ? const DesktopAppBar() : AppBar(),
          endDrawer: isDesktop ? null : const MobileDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                 HeroSection(),
                 WhyVolunteerSection(),
                 VolunteerRolesSection(),
                 VolunteerFormSection(),
                 FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}

