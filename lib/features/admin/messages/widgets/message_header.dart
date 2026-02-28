import 'package:flutter/material.dart';

import '../../../../core/constacts/text_style.dart';

class MessagesHeader extends StatelessWidget {
  const MessagesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Messages', style: AppTextStyles.h2),
        const Spacer(),
      ],
    );
  }
}