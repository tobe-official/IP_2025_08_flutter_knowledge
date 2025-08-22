import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/canvas/model/stroke.dart';

class MyPainter extends CustomPainter {
  MyPainter(this.strokes);

  final List<Stroke> strokes;

  @override
  void paint(Canvas canvas, Size size) {
    for (final s in strokes) {
      if (s.points.isEmpty) continue;

      if (s.points.length < 2) {
        canvas.drawPoints(PointMode.points, s.points, s.paint..strokeCap = StrokeCap.round);
        continue;
      }

      final path = Path()..moveTo(s.points.first.dx, s.points.first.dy);
      for (int i = 1; i < s.points.length; i++) {
        final p0 = s.points[i - 1];
        final p1 = s.points[i];
        final mid = Offset((p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
        path.quadraticBezierTo(p0.dx, p0.dy, mid.dx, mid.dy);
      }
      final last = s.points.last;
      path.lineTo(last.dx, last.dy);

      canvas.drawPath(path, s.paint);
    }
  }

  @override
  bool shouldRepaint(covariant MyPainter oldDelegate) => true;
}
