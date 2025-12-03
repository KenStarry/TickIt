import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';

import '../../../../core/utils/functions/file_compression.dart';
import 'components/ticket_clipper.dart';
import 'fonts/pdf_fonts.dart';

Future<Uint8List> ticketReceiptPdf({
  PdfPageFormat? format,
  required TicketModel ticketModel,
}) async {
  final font = await PdfFonts.urbanistRegular;
  final boldFont = await PdfFonts.urbanistBold;
  final italicFont = await PdfFonts.urbanistItalic;

  // Await the download HERE, before building the PDF
  // final netImage = await networkImage(ticketModel.ticketCoverUrl);

  final pdf = pw.Document();

  // Await the download
  final rawBytes = await fetchImage(ticketModel.ticketCoverUrl);

  // Process the blur on a separate thread (computationally expensive!)
  final blurredBytes = await compute(blurImageBytes, rawBytes);

  final netImage = pw.MemoryImage(rawBytes);
  final blurredImage = pw.MemoryImage(blurredBytes);

  // Settings
  const double cardWidth = 300;
  const double cardHeight = 450;
  const double biteSize = 30.0; // Total height of the bite area
  const double biteRadius = 15.0;
  // Calculate heights based on split (72%)
  const double topSectionHeight = (cardHeight * 0.72) - (biteSize / 2);
  const double bottomSectionHeight = (cardHeight * 0.28) - (biteSize / 2);

  // --- Dimensions ---
  // Let's simplify the math: The "Cut" is exactly at 72% down
  const double holeY = cardHeight * 0.72;

  pdf.addPage(
    pw.Page(
      pageTheme: pw.PageTheme(
        buildBackground: (context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Stack(
            children: [
              pw.Image(blurredImage, fit: pw.BoxFit.cover),

              // pw.Positioned.fill(
              //   child: pw.Container(color: PdfColors.black(0.3)),
              // ),
            ],
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
      build: (context) => pw.FullPage(
        ignoreMargins: false,
        child: pw.Container(
          width: double.infinity,
          height: double.infinity,
          decoration: pw.BoxDecoration(
            // color: PdfColors.tr,
            borderRadius: pw.BorderRadius.circular(12),
          ),
          child: pw.Stack(
            children: [
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

              pw.Column(
                children: [
                  // PART A: TOP SECTION (Rounded Top)
                  pw.Container(
                    height: topSectionHeight,
                    width: double.infinity,
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.white,
                      borderRadius: pw.BorderRadius.vertical(
                        top: pw.Radius.circular(15),
                      ),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Expanded(
                          child: pw.Image(netImage, fit: pw.BoxFit.cover),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Padding(padding: pw.EdgeInsets.symmetric(horizontal: 20),
                            child: pw.Column(
                                children: [
                                  pw.Text(
                                    "EVENT",
                                    style: const pw.TextStyle(
                                      fontSize: 10,
                                      color: PdfColors.grey500,
                                    ),
                                  ),
                                  pw.Text(
                                    ticketModel.ticketTitle,
                                    style: pw.TextStyle(
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ]
                            )),
                      ],
                    ),
                  ),

                  // pw.SizedBox(height: 50),

                  // PART B: MIDDLE SECTION (The "Bites")
                  pw.Container(
                    height: biteSize,
                    width: double.infinity,
                    color: PdfColors.white,
                    child: pw.Row(
                      children: [
                        pw.Container(
                          width: biteSize,
                          height: biteSize,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.black,
                            borderRadius: pw.BorderRadius.only(
                              topRight: pw.Radius.circular(20),
                              bottomRight: pw.Radius.circular(20),
                            ),
                          ),
                        ),
                        // Left White Corner (Custom shape could go here, but square is simpler)
                        // Or simply leave gaps if we want the "bite" to be transparent

                        // To make it look like a "circle cut", we need complex shapes.
                        // SIMPLER APPROACH: A white container with dashed line
                        pw.Expanded(
                          child: pw.Container(
                            color: PdfColors.white,
                            // Continues the white bg
                            child: pw.Center(
                              child: pw.Divider(
                                color: PdfColors.grey900,
                                borderStyle: pw.BorderStyle.dashed,
                              ),
                            ),
                          ),
                        ),

                        pw.Container(
                          width: biteSize,
                          height: biteSize,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.black,
                            borderRadius: pw.BorderRadius.only(
                              topLeft: pw.Radius.circular(20),
                              bottomLeft: pw.Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // pw.SizedBox(height: 50),
                  pw.Container(
                    width: double.infinity,
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.white,
                      borderRadius: pw.BorderRadius.vertical(
                        bottom: pw.Radius.circular(15),
                      ),
                    ),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                "NAME:",
                                style: pw.TextStyle(
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex("3C4049"),
                                ),
                              ),
                              pw.Text(
                                "Elena Gilbert",
                                style: pw.TextStyle(
                                  fontSize: 24,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          pw.BarcodeWidget(
                            data: ticketModel.ticketId,
                            barcode: pw.Barcode.qrCode(),
                            width: 80,
                            height: 80,
                            drawText: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]
          )
        ),
      ),
    ),
  );

  return pdf.save();
}
