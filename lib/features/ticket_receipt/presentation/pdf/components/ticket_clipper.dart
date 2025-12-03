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

  canvas.moveTo(0, 0);
  canvas.lineTo(width, 0);

  canvas.lineTo(width, holeY - holeRadius);

  canvas.curveTo(
      width - holeRadius, holeY - holeRadius,
      width - holeRadius, holeY + holeRadius,
      width, holeY + holeRadius
  );

  canvas.lineTo(width, height);
  canvas.lineTo(0, height);

  // 3. Left Side + Hole
  canvas.lineTo(0, holeY + holeRadius);

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