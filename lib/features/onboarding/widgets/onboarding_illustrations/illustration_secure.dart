import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/divider_line.dart';

class IllustrationSecure extends StatelessWidget {
  const IllustrationSecure({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: AppCard(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRow1(),
            const DividerLine(),
            _buildRow2(),
            const DividerLine(),
            _buildRow3(),
          ],
        ),
      ),
    );
  }

  Widget _buildRow1() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.security, color: AppColors.mutedText, size: 20),
          const SizedBox(width: 12),
          Expanded(child: _buildLine(100)),
          const SizedBox(width: 12),
          Container(width: 32, height: 16, decoration: BoxDecoration(color: AppColors.surfaceBright, borderRadius: BorderRadius.circular(8))),
        ],
      ),
    );
  }

  Widget _buildRow2() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.vpn_key, color: AppColors.mutedText, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLine(80),
                const SizedBox(height: 8),
                _buildLine(120),
                const SizedBox(height: 12),
                Container(height: 24, decoration: BoxDecoration(color: AppColors.surfaceBright, borderRadius: BorderRadius.circular(4))),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              _buildLine(40),
              const SizedBox(height: 8),
              _buildLine(40),
              const SizedBox(height: 12),
              Container(width: 32, height: 16, decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(8))),
              const SizedBox(height: 8),
              Container(width: 32, height: 16, decoration: BoxDecoration(color: AppColors.surfaceBright, borderRadius: BorderRadius.circular(8))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow3() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.credit_card, color: AppColors.mutedText, size: 20),
          const SizedBox(width: 12),
          Expanded(child: _buildLine(60)),
          const SizedBox(width: 12),
          Container(width: 60, height: 24, decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(4))),
        ],
      ),
    );
  }

  Widget _buildLine(double width) {
    return Container(
      width: width,
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
