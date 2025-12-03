import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:printing/printing.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/ticket_category/domain/model/ticket_model.dart';

import '../../../../core/utils/functions/file_compression.dart';
import '../../../../core/utils/functions/share_plus_utility.dart';
import '../pdf/ticket_receipt_pdf.dart';

class TicketReceipt extends StatefulWidget {
  final TicketCategoryModel ticketModel;

  const TicketReceipt({super.key, required this.ticketModel});

  @override
  State<TicketReceipt> createState() => _TicketReceiptState();
}

class _TicketReceiptState extends State<TicketReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 80,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(color: Colors.transparent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/svg/close.svg",
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    context.colors.iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "PDF Viewer",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final pdf = await ticketReceiptPdf(
                    ticketModel: widget.ticketModel,
                  );
                  final file = await convertUint8ListToFile(
                    pdf,
                    path:
                        '/Ticket-${widget.ticketModel.categoryTitle}_${DateTime.now().millisecondsSinceEpoch}.pdf',
                  );

                  if (file == null) {
                    // showCribLynkSnackbar(context, "Could not generate image");
                  } else {
                    shareImageFile(file);
                  }
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: context.colors.surfaceContainerHigh, width: 2),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svg/share.svg",
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                        context.colors.iconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 30, top: 120),
        color: Colors.black.withValues(alpha: 0.4),
        child: PdfPreview(
          canChangePageFormat: false,
          canChangeOrientation: false,
          allowSharing: false,
          allowPrinting: false,
          actions: null,
          loadingWidget: SpinKitSpinningLines(
            color: context.colors.primaryColor,
            size: 60,
          ),
          pdfPreviewPageDecoration: BoxDecoration(color: Colors.transparent),
          scrollViewDecoration: BoxDecoration(color: Colors.transparent),
          previewPageMargin: EdgeInsets.only(bottom: 24),
          padding: EdgeInsets.only(bottom: 100),
          build: (format) => ticketReceiptPdf(ticketModel: widget.ticketModel),
        ),
      ),
    );
  }
}
