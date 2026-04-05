import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/messages/widgets/detail_panel.dart';
import 'package:sopnojoy/features/admin/messages/widgets/list_panel.dart';
import 'package:sopnojoy/features/admin/messages/widgets/message_header.dart';
import 'package:sopnojoy/features/admin/messages/widgets/state_widgets.dart';

import '../../../core/constacts/spacing.dart';
import '../../../core/provider/admin_message_provider.dart';
import '../shared/layout/admin_layout.dart';

class MessagesScreen extends ConsumerWidget {
  const MessagesScreen({super.key, required String currentRoute});
  static const name = '/shopnopanelx/messages';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMessages = ref.watch(messagesProvider);

    return AdminLayout(
      currentRoute: name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MessagesHeader(),
          const SizedBox(height: AppSpacing.xl),
          Expanded(
            child: asyncMessages.when(
              data: (messages) {
                if (messages.isEmpty) {
                  return const EmptyStateWidget();
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop = constraints.maxWidth > 1000;

                    if (isDesktop) {
                      return Row(
                        children: const [
                          Expanded(flex: 2, child: MessagesListPanel()),
                          SizedBox(width: AppSpacing.xl),
                          Expanded(flex: 3, child: MessageDetailsPanel()),
                        ],
                      );
                    }

                    return const MessagesListPanel();
                  },
                );
              },
              loading: () =>
              const Center(child: CircularProgressIndicator()),
              error: (e, _) =>
                  ErrorStateWidget(message: e.toString()),
            ),
          ),
        ],
      ),
    );
  }
}