import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class IllustrationInsights extends StatelessWidget {
  const IllustrationInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: 0.15,
        child: CustomPaint(
          size: const Size(200, 140),
          painter: _InsightsPainter(),
        ),
      ),
    );
  }
}

class _InsightsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = AppColors.surfaceContainerHigh;
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(8),
    );
    canvas.drawRRect(rrect, bgPaint);

    final greenPaint = Paint()
      ..color = AppColors.success
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final redPaint = Paint()
      ..color = AppColors.error
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final thinGreenPaint = Paint()
      ..color = AppColors.success
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(20, 40),
      Offset(size.width - 20, 40),
      greenPaint,
    );
    canvas.drawLine(
      const Offset(20, 70),
      Offset(size.width - 20, 70),
      redPaint,
    );
    canvas.drawLine(
      const Offset(20, 100),
      Offset(size.width - 20, 100),
      thinGreenPaint,
    );

    final cornerPaint = Paint()
      ..color = AppColors.surfaceContainerHigh.withValues(alpha: 0.3);
    canvas.drawRect(const Rect.fromLTWH(-10, -10, 30, 30), cornerPaint);
    canvas.drawRect(
      Rect.fromLTWH(size.width - 20, size.height - 20, 30, 30),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
