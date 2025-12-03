import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:tickit/core/theme/extensions/tickit_colors.dart';
import 'package:tickit/features/ticket_category/domain/model/ticket_category_model.dart';

import '../../../../core/utils/functions/file_compression.dart';
import 'components/ticket_clipper.dart';
import 'fonts/pdf_fonts.dart';

Future<Uint8List> ticketReceiptPdf({
  PdfPageFormat? format,
  required TicketCategoryModel ticketModel,
}) async {
  final font = await PdfFonts.urbanistRegular;
  final boldFont = await PdfFonts.urbanistBold;
  final italicFont = await PdfFonts.urbanistItalic;

  final verifiedBytes = await rootBundle.load('assets/images/verified.png');
  final verifiedImage = pw.MemoryImage(verifiedBytes.buffer.asUint8List());

  // final netImage = await networkImage(ticketModel.ticketCoverUrl);

  final pdf = pw.Document();

  // Await the download
  final rawBytes = await fetchImage(ticketModel.categoryCoverUrl);

  // Process the blur on a separate thread (computationally expensive!)
  final blurredBytes = await compute(blurImageBytes, rawBytes);

  final netImage = pw.MemoryImage(rawBytes);
  final blurredImage = pw.MemoryImage(blurredBytes);

  // Settings
  const double cardWidth = 500;
  const double cardHeight = 750;
  const double biteSize = 30.0; // Total height of the bite area
  const double biteRadius = 30.0;

  // --- Dimensions ---
  // Let's simplify the math: The "Cut" is exactly at 72% down
  const double holeY = cardHeight * 0.2;

  pdf.addPage(
    pw.Page(
      pageTheme: pw.PageTheme(
        buildBackground: (context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Stack(
            children: [pw.Image(blurredImage, fit: pw.BoxFit.cover)],
          ),
        ),
        theme: pw.ThemeData.withFont(
          base: font,
          bold: boldFont,
          italic: italicFont,
        ),
        pageFormat: format,
        margin: pw.EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      build: (context) {
        return pw.Center(
          child: pw.Container(
            width: cardWidth,
            height: cardHeight,
            child: pw.Stack(
              children: [
                // LAYER 1: The Custom White Shape (The Paper)
                pw.CustomPaint(
                  size: const PdfPoint(cardWidth, cardHeight),
                  painter: (canvas, size) => drawTicketShape(
                    context,
                    width: cardWidth,
                    height: cardHeight,
                    holeRadius: biteRadius,
                    holeY: holeY,
                  ),
                ),

                // LAYER 2: The Content (Transparent background)
                pw.Container(
                  child: pw.Column(
                    children: [
                      // --- TOP SECTION ---
                      pw.Expanded(
                        flex: 80, // Matches the 0.72 split
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(0),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Expanded(
                                child: pw.ClipRRect(
                                  // horizontalRadius: 24,
                                  verticalRadius: 24,
                                  child: pw.Image(
                                    netImage,
                                    fit: pw.BoxFit.cover,
                                  ),
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "MOVIE",
                                      style: const pw.TextStyle(
                                        fontSize: 10,
                                        color: PdfColors.grey500,
                                      ),
                                    ),
                                    pw.Row(
                                      children: [
                                        pw.Expanded(
                                          child: pw.Text(
                                            ticketModel.categoryTitle,
                                            style: pw.TextStyle(
                                              fontSize: 28,
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        pw.Row(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          children: [
                                            pw.Image(
                                              verifiedImage,
                                              width: 30,
                                              height: 30,
                                              fit: pw.BoxFit.cover,
                                            ),
                                            pw.SizedBox(width: 10),
                                            pw.Text(
                                              "Resolved",
                                              style: pw.TextStyle(
                                                fontSize: 24,
                                                fontWeight: pw.FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),

                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                          horizontal: biteRadius + 2,
                        ),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: List.generate(
                            12,
                            (index) => pw.Expanded(
                              child: pw.Container(
                                width: double.infinity,
                                height: 2,
                                margin: pw.EdgeInsets.only(left: 4, right: 4),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromHex(
                                    TickItColors.light.grey300.toHex(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      pw.Expanded(
                        flex: 20,
                        child: pw.Padding(
                          padding: const pw.EdgeInsets.all(20),
                          child: pw.Column(
                            children: [
                              pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Expanded(
                                    child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          children: [
                                            pw.Text(
                                              "NAME:",
                                              style: pw.TextStyle(
                                                fontSize: 12,
                                                color: PdfColors.grey700,
                                              ),
                                            ),
                                            pw.Text(
                                              "Elena Gilbert",
                                              style: pw.TextStyle(
                                                fontSize: 20,
                                                fontWeight: pw.FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),

                                        pw.SizedBox(height: 16),

                                        pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          children: [
                                            pw.Text(
                                              "Amount:",
                                              style: pw.TextStyle(
                                                fontSize: 12,
                                                color: PdfColors.grey700,
                                              ),
                                            ),
                                            pw.Text(
                                              ticketModel.categoryAmount
                                                  .toCurrency(),
                                              style: pw.TextStyle(
                                                fontSize: 20,
                                                fontWeight: pw.FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  pw.BarcodeWidget(
                                    data: ticketModel.categoryId,
                                    barcode: pw.Barcode.qrCode(),
                                    width: 80,
                                    height: 80,
                                    drawText: false,
                                  ),
                                ],
                              ),

                              pw.Text(
                                "Tick - #1278hjsd",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColors.grey700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );

  return pdf.save();
}
