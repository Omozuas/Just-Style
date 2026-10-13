import 'dart:math';
import 'package:flutter/material.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = blue
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2 - 1.5,
    );

    // Draw arc with 100-degree gap, starting so gap ends bottom-right
    canvas.drawArc(
      rect,
      pi / 2.4, // 45° start
      2 * pi - (107 * pi / 180), // 260° sweep
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
