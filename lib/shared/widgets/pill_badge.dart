import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

enum BadgeType { success, warning, error, info, neutral }

class PillBadge extends StatelessWidget {
  final String label;
  final BadgeType type;

  const PillBadge(this.label, {super.key, this.type = BadgeType.neutral});

  @override
  Widget build(BuildContext context) {
    Color textColor;
    switch (type) {
      case BadgeType.success:
        textColor = AppColors.success;
        break;
      case BadgeType.warning:
        textColor = AppColors.warning;
        break;
      case BadgeType.error:
        textColor = AppColors.error;
        break;
      case BadgeType.info:
        textColor = AppColors.info;
        break;
      case BadgeType.neutral:
        textColor = AppColors.mutedText;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: textColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelCaps.copyWith(color: textColor),
      ),
    );
  }
}
