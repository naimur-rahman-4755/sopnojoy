import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constacts/spacing.dart';
import '../../../core/constacts/text_style.dart';
import '../shared/layout/admin_layout.dart';
import 'widgets/add_event_dialog.dart';
import 'widgets/event_card.dart';
import '../../../core/provider/supabase_provider.dart';

class AdminEventsScreen extends ConsumerWidget {
  const AdminEventsScreen({super.key});

  static const name = "/admin/events";

  int _gridCount(double width) {
    if (width > 1100) return 3;
    if (width > 700) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final eventsAsync = ref.watch(eventsProvider);

    return AdminLayout(
      currentRoute: name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const Text("Events", style: AppTextStyles.pageTitle),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AddEventDialog(),
                  );
                },
                child: const Text("Add Event"),
              )
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {

                final columns = _gridCount(constraints.maxWidth);

                return eventsAsync.when(
                  loading: () =>
                  const Center(child: CircularProgressIndicator()),

                  error: (e, _) =>
                      Center(child: Text("Error loading events")),

                  data: (events) {

                    if (events.isEmpty) {
                      return const Center(
                        child: Text("No events created yet."),
                      );
                    }

                    return GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: AppSpacing.lg,
                        mainAxisSpacing: AppSpacing.lg,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: events.length,
                      itemBuilder: (context, index) {

                        final event = events[index];

                        return EventCard(
                          event: event,
                          onEdit: () {},
                          onDelete: () async {

                            final confirm = await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Delete Event"),
                                content: const Text(
                                    "Are you sure you want to delete this event?"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text("Delete"),
                                  ),
                                ],
                              ),
                            );

                            if (confirm == true) {

                              final service =
                              ref.read(supabaseServiceProvider);

                              await service.deleteEvent(event.id);

                              ref.invalidate(eventsProvider);
                            }
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}