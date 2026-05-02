import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/pill_badge.dart';

class IllustrationRealtime extends StatelessWidget {
  const IllustrationRealtime({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.7,
                  child: AppCard(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('REQUESTS', style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('4.2k', style: AppTextStyles.statValue),
                            const SizedBox(width: 8),
                            const PillBadge('+12%', type: BadgeType.success),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Opacity(
                  opacity: 0.7,
                  child: AppCard(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LATENCY', style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('24ms', style: AppTextStyles.statValue),
                            const SizedBox(width: 8),
                            Text('— Stable', style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Opacity(
              opacity: 0.7,
              child: SizedBox(
                width: 250,
                child: AppCard(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SYSTEM HEALTH', style: AppTextStyles.labelCaps.copyWith(color: AppColors.mutedText)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDot(AppColors.mutedText),
                          _buildDot(AppColors.accent),
                          _buildDot(AppColors.mutedText),
                          _buildDot(AppColors.mutedText),
                          _buildDot(AppColors.mutedText),
                          _buildDot(AppColors.mutedText),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 24,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
