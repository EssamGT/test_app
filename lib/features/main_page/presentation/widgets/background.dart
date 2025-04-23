import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';

class LinedPaperBackground extends StatelessWidget {
  final Widget child;

  const LinedPaperBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: _LinedPaperPainter(),
          child: child,
        );
      },
    );
  }
}

class _LinedPaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = ColorManager.lightGreen
          ..strokeWidth = 1;

    // Horizontal lines every 48 pixels
    for (double y = 0; y < size.height; y += 48) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Vertical margin line (left)
    final marginPaint =
        Paint()
          ..color = ColorManager.lightGreen
          ..strokeWidth = 1;
    canvas.drawLine(const Offset(40, 0), Offset(40, size.height), marginPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
