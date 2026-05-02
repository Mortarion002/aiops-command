import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/loading_shimmer.dart';
import '../providers/insights_provider.dart';
import '../widgets/insight_card.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insightsAsync = ref.watch(insightsDataProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.surfaceContainer,
          onRefresh: () async => ref.invalidate(insightsDataProvider),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("AI Insights", style: AppTextStyles.h1),
                const SizedBox(height: 8),
                Text(
                  "Automated analysis of your infrastructure and models.",
                  style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: insightsAsync.when(
                    data: (insights) => ListView.separated(
                      itemCount: insights.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) => InsightCard(item: insights[index]),
                    ),
                    loading: () => ListView.separated(
                      itemCount: 3,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) => const LoadingShimmer(height: 200),
                    ),
                    error: (_, __) => Text("Failed to load insights", style: AppTextStyles.bodyMd.copyWith(color: AppColors.error)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
