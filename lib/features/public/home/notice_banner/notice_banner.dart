import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/provider/supabase_provider.dart';
import 'notice_banner_model.dart';
class NoticeBanner extends ConsumerWidget {
  const NoticeBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noticeAsync = ref.watch(noticeProvider);

    return noticeAsync.when(
      loading: () => const _NoticeLoader(),
      error: (_, __) => const SizedBox.shrink(),
      data: (notice) {
        if (notice == null) {
          return const SizedBox.shrink();
        }

        return _NoticeContent(notice: notice);
      },
    );
  }
}

class _NoticeContent extends StatelessWidget {
  final Notice notice;

  const _NoticeContent({required this.notice});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
      const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: AppColors.primaryBlue.withOpacity(0.12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondaryOrange,
                borderRadius:
                BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Text(
                notice.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                notice.message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                  color: AppColors.bodyText,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoticeLoader extends StatelessWidget {
  const _NoticeLoader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}