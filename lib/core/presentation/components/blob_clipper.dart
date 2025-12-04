import 'package:flutter/material.dart';

class BottomBlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at top-left
    path.moveTo(0, 0);

    // Line to top-right
    path.lineTo(size.width, 0);

    // Line to bottom-right
    path.lineTo(size.width, size.height * 0.85);

    // Curve across the bottom
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width * 0.5,
      size.height * 0.9,
    );
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.8,
      0,
      size.height * 0.95,
    );

    // Close back to start
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}