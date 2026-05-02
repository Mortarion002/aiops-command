import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_spacing.dart';
import '../providers/auth_provider.dart';

class AuthErrorBanner extends ConsumerWidget {
  const AuthErrorBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(authErrorNotifierProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: error == null
          ? const SizedBox.shrink()
          : Container(
              key: ValueKey(error),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.errorContainer,
                border: Border.all(color: AppColors.error, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: AppColors.error, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      error,
                      style: AppTextStyles.bodyMd.copyWith(color: AppColors.onBackground),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
