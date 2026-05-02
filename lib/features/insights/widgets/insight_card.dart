import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/pill_badge.dart';
import '../models/insight_item_model.dart';

class InsightCard extends StatelessWidget {
  final InsightItem item;

  const InsightCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(item.title, style: AppTextStyles.h3)),
              PillBadge(item.severity, type: item.severityBadgeType),
            ],
          ),
          const SizedBox(height: 12),
          Text(item.description, style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 16, color: AppColors.mutedText),
              const SizedBox(width: 8),
              Text("Impact: ", style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
              Text(item.impact, style: AppTextStyles.bodyMd),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceBright,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.outlineVariant),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("RECOMMENDED ACTION", style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
                const SizedBox(height: 4),
                Text(item.recommendedAction, style: AppTextStyles.bodyMd.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
