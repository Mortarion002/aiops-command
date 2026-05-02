import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';

class SectionLabel extends StatelessWidget {
  final String label;
  final Widget? trailing;

  const SectionLabel(this.label, {super.key, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label.toUpperCase(),
          style: AppTextStyles.labelCaps,
        ),
        if (trailing != null) ...[
          const Spacer(),
          trailing!,
        ],
      ],
    );
  }
}
