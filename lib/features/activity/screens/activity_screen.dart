import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/loading_shimmer.dart';
import '../providers/activity_provider.dart';
import '../widgets/log_viewer.dart';

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(logFilterProvider);
    final logsAsync = ref.watch(logsDataProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Activity Logs", style: AppTextStyles.h1),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['All', 'Info', 'Warn', 'Error', 'Gateway', 'Vector DB', 'Workers'].map((f) {
                    final isSelected = filter == f;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        selected: isSelected,
                        label: Text(f, style: AppTextStyles.bodyMd.copyWith(color: isSelected ? AppColors.onPrimary : AppColors.onBackground)),
                        backgroundColor: AppColors.surfaceContainer,
                        selectedColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: isSelected ? AppColors.primary : AppColors.outline),
                        ),
                        onSelected: (_) => ref.read(logFilterProvider.notifier).setFilter(f),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: logsAsync.when(
                  data: (logs) => SingleChildScrollView(child: LogViewer(logs: logs)),
                  loading: () => const LoadingShimmer(height: double.infinity),
                  error: (_, __) => Text("Error loading logs", style: AppTextStyles.bodyMd.copyWith(color: AppColors.error)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
