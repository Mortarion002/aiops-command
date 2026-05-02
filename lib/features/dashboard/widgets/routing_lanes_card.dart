import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/section_label.dart';
import '../models/routing_lane_model.dart';

class RoutingLanesCard extends StatelessWidget {
  final List<RoutingLane> lanes;

  const RoutingLanesCard({super.key, required this.lanes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel("Routing Lanes"),
        const SizedBox(height: 8),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: lanes.map((lane) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: lane.isHealthy ? AppColors.success : AppColors.error,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(lane.region, style: AppTextStyles.bodyMd),
                    ),
                    Text(lane.requests, style: AppTextStyles.bodyMd.copyWith(color: AppColors.mutedText)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
