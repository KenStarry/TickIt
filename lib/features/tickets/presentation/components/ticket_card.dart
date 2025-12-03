import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:tickit/core/presentation/components/custom_network_image.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';

import '../../../../core/utils/extensions/context_extensions.dart';

class TicketCard extends StatefulWidget {
  final TicketModel ticketModel;

  const TicketCard({super.key, required this.ticketModel});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 16,
        children: [
          Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            spacing: 16,
            children: [
              Text(
                "LIVE",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: context.colors.primaryColor,
                ),
              ),
              Container(
                width: 1,
                height: 20,
                decoration: BoxDecoration(color: context.colors.iconColor),
              ),
              Column(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                spacing: 8,
                children: List.generate(
                  3,
                  (index) => UnconstrainedBox(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: .circular(100),
                        color: context.colors.surfaceColor,
                      ),
                      child: CustomNetworkImage(
                        url: 5.randomString.avatar(
                          style: DiceBearStyle.adventurer,
                        ),
                        borderRadius: .circular(100),
                      ),
                    ),
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                spacing: 8,
                children: [
                  Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      color: context.colors.iconColor,
                      shape: .circle,
                    ),
                  ),
                  Text(
                    "45",
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.colors.textBlack600,
                    ),
                  ),
                ],
              ),

              ...List.generate(
                1,
                (index) => Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: context.colors.iconColor,
                    shape: .circle,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const .only(bottom: 16, top: 16),
              child: Stack(
                children: [
                  CustomNetworkImage(
                    url: widget.ticketModel.ticketCoverUrl,
                    borderRadius: .circular(24),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        // color: context.colors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.0),
                            // fully transparent top
                            Colors.black.withValues(alpha: 0.15),
                            // gentle lift
                            Colors.black.withValues(alpha: 0.45),
                            // soft smoke start
                            Colors.black.withValues(alpha: 0.75),
                            // warm mid haze
                            Colors.black.withValues(alpha: 0.95),
                            // almost solid
                            Colors.black.withValues(alpha: 1.0),
                            // solid bottom blend
                          ],
                          stops: const [
                            0.0, // pure top
                            0.18, // light mist
                            0.38, // smoke begins
                            0.62, // body of smoke
                            0.82, // thick fade
                            1.0, // full blend
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const .symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .end,
                      children: [
                        //  Title
                        Text(
                          widget.ticketModel.ticketTitle,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: .bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),

                        //  Explanation
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
