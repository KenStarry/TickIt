import 'package:flutter/material.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';

class TicketReceipt extends StatefulWidget {
  final TicketModel ticketModel;

  const TicketReceipt({super.key, required this.ticketModel});

  @override
  State<TicketReceipt> createState() => _TicketReceiptState();
}

class _TicketReceiptState extends State<TicketReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      body: SizedBox(width: double.infinity, height: double.infinity),
    );
  }
}
