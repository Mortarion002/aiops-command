import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_card.dart';

class IllustrationActivity extends StatelessWidget {
  const IllustrationActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          child: Opacity(
            opacity: 0.3,
            child: _buildLogCard(false),
          ),
        ),
        Positioned(
          bottom: 20,
          child: Opacity(
            opacity: 0.3,
            child: _buildLogCard(false),
          ),
        ),
        _buildLogCard(true),
      ],
    );
  }

  Widget _buildLogCard(bool active) {
    return SizedBox(
      width: 260,
      child: AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: active ? AppColors.surfaceContainerHigh : AppColors.surfaceContainer,
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: active ? AppColors.accent : AppColors.mutedText,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 8, color: active ? AppColors.primary : AppColors.outlineVariant, width: 80),
                  const SizedBox(height: 8),
                  Container(height: 8, color: AppColors.outlineVariant, width: double.infinity),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(Icons.terminal, color: active ? AppColors.primary : AppColors.mutedText, size: 20),
          ],
        ),
      ),
    );
  }
}
