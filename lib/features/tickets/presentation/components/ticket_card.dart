import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';

import '../../../../core/presentation/components/custom_network_image.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

class TicketCard extends StatefulWidget {
  final TicketModel ticketModel;
  final VoidCallback onTap;

  const TicketCard({super.key, required this.ticketModel, required this.onTap});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const .only(bottom: 16, left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: .circular(24),
          color: context.colors.surfaceColor,
        ),
        child: Row(
          crossAxisAlignment: .center,
          spacing: 16,
          children: [
            UnconstrainedBox(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  color: context.colors.surfaceColor,
                ),
                child: SvgPicture.network(
                  widget.ticketModel.ticketUserAvatarUrl ?? '',
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                spacing: 8,
                children: [
                  Text(
                    widget.ticketModel.ticketTitle ?? "No Title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(),
                  ),

                  Text(
                    widget.ticketModel.ticketBody ?? "No Body",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium?.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
