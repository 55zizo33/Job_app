import 'dart:ui';
import 'package:flutter/material.dart';

class DottedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final Radius radius;
  final EdgeInsetsGeometry padding;
  final List<double> dashPattern;

  DottedBorder({

    required this.child,
    this.color = const Color(0xFF1E90FF), // لون الأزرق الزاهي باستخدام الكود المناسب
    this.strokeWidth = 2.0, // تعيين عرض الحدود لزيادة البروز
    this.radius =const Radius.circular(8),
    this.padding = EdgeInsets.zero,
    this.dashPattern = const [5, 5], required BorderRadius borderRadius, // نمط الخطوط المتقطعة
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        radius: radius,
        dashPattern: dashPattern,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final Radius radius;
  final List<double> dashPattern;

  _DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
    required this.dashPattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          radius,
        ),
      );

    double dashWidth = dashPattern[0];
    double dashSpace = dashPattern[1];
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}




