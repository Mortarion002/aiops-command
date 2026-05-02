import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';

class CopyIconButton extends StatelessWidget {
  final String value;
  final double size;

  const CopyIconButton({
    super.key,
    required this.value,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: value));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Copied to clipboard'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Icon(
        Icons.copy,
        size: size,
        color: AppColors.mutedText,
      ),
    );
  }
}
