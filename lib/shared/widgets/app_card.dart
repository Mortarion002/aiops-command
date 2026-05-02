import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const AppCard({
    super.key,
    required this.child,
    this.radius = 12.0,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surfaceContainer,
        border: Border.all(color: AppColors.outline, width: 1),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
