import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/section_label.dart';
import '../models/chart_point_model.dart';

class RequestVolumeChart extends StatelessWidget {
  final List<ChartPoint> points;

  const RequestVolumeChart({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel("Request Volume"),
        const SizedBox(height: 8),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: points.map((p) {
                final height = (p.y / 200) * 120; // Simplified scaling
                return Container(
                  width: 8,
                  height: height.clamp(0, 120),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
