import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/text_style.dart';

class VolunteerRolesSection extends StatelessWidget {
  const VolunteerRolesSection({super.key});

  static const double _mobileBreakpoint = 600;
  static const double _tabletBreakpoint = 1024;
  static const double _maxContentWidth = 1280;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 64,
        horizontal: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Volunteer Roles',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Text(
                  'Choose a role that matches your skills and availability',
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  int crossAxisCount;
                  if (width < _mobileBreakpoint) {
                    crossAxisCount = 1;
                  } else if (width < _tabletBreakpoint) {
                    crossAxisCount = 2;
                  } else {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    itemCount: _roles.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    itemBuilder: (context, index) {
                      final role = _roles[index];

                      return Align(
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 380,
                            maxHeight: 400,
                          ),
                          child: RoleCard(
                            icon: role.icon,
                            title: role.title,
                            description: role.description,
                            commitment: role.commitment,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleModel {
  final IconData icon;
  final String title;
  final String description;
  final String commitment;

  const _RoleModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.commitment,
  });
}

const List<_RoleModel> _roles = [
  _RoleModel(
    icon: Icons.volunteer_activism,
    title: 'Field Volunteer',
    description:
    'Work directly with communities in food distribution, health camps, and awareness programs.',
    commitment: 'Commitment: Flexible, event-based',
  ),
  _RoleModel(
    icon: Icons.event,
    title: 'Event Organizer',
    description:
    'Plan and coordinate community events, campaigns, and outreach programs.',
    commitment: 'Commitment: 4–8 hours per week',
  ),
  _RoleModel(
    icon: Icons.favorite,
    title: 'Medical Support',
    description:
    'Healthcare professionals providing medical consultations and health awareness.',
    commitment: 'Commitment: Monthly health camps',
  ),
  _RoleModel(
    icon: Icons.attach_money,
    title: 'Fundraising',
    description:
    'Help raise funds and resources to support our programs and expand our reach.',
    commitment: 'Commitment: Flexible, remote options',
  ),
];

class RoleCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final String commitment;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.commitment,
  });

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isWeb = identical(0, 0.0);

    return MouseRegion(
      onEnter: isWeb ? (_) => setState(() => _hovered = true) : null,
      onExit: isWeb ? (_) => setState(() => _hovered = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_hovered ? 0.10 : 0.05),
              blurRadius: _hovered ? 24 : 12,
              offset: Offset(0, _hovered ? 10 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                size: 26,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: AppTextStyles.h4,
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 16),
            Text(
              widget.commitment,
              style: AppTextStyles.link,
            ),
          ],
        ),
      ),
    );
  }
}
