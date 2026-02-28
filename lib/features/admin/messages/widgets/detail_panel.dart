import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/messages/widgets/state_widgets.dart';

import '../../../../core/provider/admin_message_provider.dart';
import 'message_details_card.dart';

class MessageDetailsPanel extends ConsumerWidget {
  const MessageDetailsPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(selectedMessageProvider);

    if (message == null) {
      return const EmptyStateWidget(
          message: 'Select a message to view details');
    }

    return MessageDetailsCard(message: message);
  }
}