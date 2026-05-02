import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/pill_badge.dart';

class KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final String badgeText;
  final BadgeType badgeType;

  const KpiCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.badgeText,
    required this.badgeType,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 12,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(label.toUpperCase(), style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
              const Spacer(),
              PillBadge(badgeText, type: badgeType),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.statValue),
          const SizedBox(height: 4),
          Text(unit, style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
        ],
      ),
    );
  }
}
