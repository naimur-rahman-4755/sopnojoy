import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../core/provider/volunteer_admin_provider.dart';
import '../shared/layout/admin_layout.dart';
import 'widgets/volunteer_filter_bar.dart';
import 'widgets/volunteer_data_table.dart';

class VolunteerAdminScreen extends ConsumerStatefulWidget {
  const VolunteerAdminScreen({super.key, required String currentRoute});
  static const name = '/shopnopanelx/volunteers';

  @override
  ConsumerState<VolunteerAdminScreen> createState() =>
      _VolunteerAdminScreenState();
}

class _VolunteerAdminScreenState
    extends ConsumerState<VolunteerAdminScreen> {
  String filter = 'all';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(volunteerAdminProvider);

    return AdminLayout(
      currentRoute: VolunteerAdminScreen.name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Volunteer Applications', style: AppTextStyles.pageTitle),
          const SizedBox(height: AppSpacing.lg),

          state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
            data: (data) {
              final filtered = filter == 'all'
                  ? data
                  : data.where((v) => v.status == filter).toList();

              return Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.lg),
                    Expanded(
                      child: VolunteerDataTable(volunteers: filtered),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}