import 'package:flutter/material.dart';

class GoogleLogo extends StatelessWidget {
  final double size;

  const GoogleLogo({Key? key, this.size = 24.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GoogleLogoPainter(),
      ),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Colors used in the Google logo
    const Color blue = Color(0xFF4285F4);
    const Color red = Color(0xFFEA4335);
    const Color yellow = Color(0xFFFBBC05);
    const Color green = Color(0xFF34A853);

    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = width / 8;

    // Center point
    final center = Offset(width / 2, height / 2);
    final radius = width * 0.35;

    // Draw the colored segments
    paint.color = blue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.5,
      1.5,
      true,
      paint,
    );

    paint.color = red;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.0,
      1.5,
      true,
      paint,
    );

    paint.color = yellow;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      2.5,
      1.5,
      true,
      paint,
    );

    paint.color = green;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      4.0,
      1.5,
      true,
      paint,
    );

    // Draw the white center
    paint.color = Colors.white;
    canvas.drawCircle(
      center,
      radius * 0.65,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
