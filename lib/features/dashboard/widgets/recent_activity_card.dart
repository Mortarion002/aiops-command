import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/section_label.dart';
import '../../../shared/widgets/divider_line.dart';
import '../models/activity_item_model.dart';

class RecentActivityCard extends StatelessWidget {
  final List<RecentActivityItem> activities;

  const RecentActivityCard({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel("Recent Activity"),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: activities.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 6),
                          decoration: BoxDecoration(
                            color: item.isHighlight ? AppColors.accent : AppColors.surfaceBright,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.message, style: AppTextStyles.bodyMd),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(item.timeAgo, style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
                                  const SizedBox(width: 8),
                                  Text('•', style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
                                  const SizedBox(width: 8),
                                  Text(item.source, style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index < activities.length - 1) const DividerLine(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
