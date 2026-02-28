import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';
import '../../../../core/provider/event_provider.dart';
import 'event_card.dart';
import 'package:intl/intl.dart';

class UpcomingEventsSection extends ConsumerWidget {
  const UpcomingEventsSection({super.key});

  String _formatDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(upcomingEventsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Column(
        children: [
          const Text('Upcoming Events', style: AppTextStyles.h2),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Join us in making a difference',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppSpacing.xl),

          eventsAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: CircularProgressIndicator(),
            ),
            error: (error, _) => Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Text(
                error.toString(),
                style: AppTextStyles.body,
              ),
            ),
            data: (events) {
              if (events.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: Text(
                    'No upcoming events available.',
                    style: AppTextStyles.body,
                  ),
                );
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  int columns = constraints.maxWidth >= 900
                      ? 3
                      : constraints.maxWidth >= 600
                      ? 2
                      : 1;

                  return ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxWidth: AppSpacing.maxContentWidth),
                    child: GridView.count(
                      crossAxisCount: columns,
                      shrinkWrap: true,
                      physics:
                      const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: AppSpacing.lg,
                      mainAxisSpacing: AppSpacing.lg,
                      childAspectRatio: 1.25,
                      children: events
                          .map(
                            (event) => EventCard(
                          title: event.title,
                          date: _formatDate(event.eventDate),
                          location: event.location ?? '',
                          description:
                          event.description ?? '',
                        ),
                      )
                          .toList(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}