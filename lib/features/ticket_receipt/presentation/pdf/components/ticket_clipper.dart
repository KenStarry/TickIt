import 'dart:ui';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void drawTicketShape(pw.Context context, {
  required double width,
  required double height,
  required double holeRadius,
  required double holeY,
}) {
  final canvas = context.canvas;

  // 1. Start Path
  canvas.moveTo(0, 0);
  canvas.lineTo(width, 0);

  // 2. Right Side + Hole
  canvas.lineTo(width, holeY - holeRadius);

  // ERROR FIX: Use 'curveTo' instead of 'cubicTo'
  canvas.curveTo(
      width - holeRadius, holeY - holeRadius, // Control Point 1 (Top corner of curve)
      width - holeRadius, holeY + holeRadius, // Control Point 2 (Bottom corner of curve)
      width, holeY + holeRadius               // End Point (Back on the edge)
  );

  canvas.lineTo(width, height);
  canvas.lineTo(0, height);

  // 3. Left Side + Hole
  canvas.lineTo(0, holeY + holeRadius);

  // ERROR FIX: Use 'curveTo' instead of 'cubicTo'
  canvas.curveTo(
      holeRadius, holeY + holeRadius, // Control Point 1
      holeRadius, holeY - holeRadius, // Control Point 2
      0, holeY - holeRadius           // End Point
  );

  canvas.lineTo(0, 0);

  // 4. Fill
  canvas.setFillColor(PdfColors.white);
  canvas.fillPath();
}