import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppColors.outline,
    );
  }
}
