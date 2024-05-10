import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Concentric Semi-Circles'),
        ),
        body: Center(
          child: ConcentricSemiCircles(),
        ),
      ),
    );
  }
}

class ConcentricSemiCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: ConcentricSemiCirclesPainter(),
    );
  }
}

class ConcentricSemiCirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double outerRadius = math.min(centerX, centerY);
    final double innerRadius =
        outerRadius * 0.5; // Adjust this value for the inner semi-circle

    final double strokeWidth = 10.0;

    // Define a gradient for the outer semi-circle
    final outerGradient = SweepGradient(
      startAngle: 0,
      endAngle: math.pi,
      colors: [Colors.grey.withOpacity(0.2), Colors.grey],
    );

    // Define a gradient for the inner semi-circle
    final innerGradient = SweepGradient(
      startAngle: 0,
      endAngle: math.pi,
      colors: [Colors.grey.withOpacity(0.2), Colors.grey.withOpacity(0.6)],
    );

    Paint outerPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = outerGradient.createShader(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: outerRadius),
      );

    Paint innerPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = innerGradient.createShader(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: innerRadius),
      );

    // Draw outer semi-circle
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: outerRadius),
      0,
      math.pi,
      false,
      outerPaint,
    );

    // Draw inner semi-circle
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: innerRadius),
      0,
      math.pi,
      false,
      innerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
