import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickit/features/dashboard/presentation/components/global_overlay.dart';
import 'package:tickit/features/ticket_category_details/presentation/pages/ticket_category_detail_page.dart';
import 'package:tickit/features/ticket_category/domain/model/ticket_category_model.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';
import 'package:tickit/features/tickets/presentation/bloc/tickets_bloc.dart';

import '../../../../core/presentation/components/material_motion.dart';
import '../../../../core/utils/extensions/context_extensions.dart';
import '../../../tickets/presentation/bloc/ticket_resolver_cubit.dart';

class TicketCategoryCard extends StatefulWidget {
  final TicketCategoryModel ticketModel;
  final bool isLoading;

  const TicketCategoryCard({
    super.key,
    required this.ticketModel,
    required this.isLoading,
  });

  @override
  State<TicketCategoryCard> createState() => _TicketCategoryCardState();
}

class _TicketCategoryCardState extends State<TicketCategoryCard> {
  Widget detailRow({required String asset, required String title}) =>
      widget.isLoading
      ? Container(
              width: 50,
              height: 15,
              decoration: BoxDecoration(
                color: context.colors.backgroundColor,
                borderRadius: .circular(100),
              ),
            )
            .animate(
              autoPlay: true,
              onComplete: (controller) => controller.repeat(reverse: true),
            )
            .shimmer(
              duration: 2.seconds,
              color: context.colors.iconColor.withValues(alpha: 0.3),
            )
      : Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .start,
          spacing: 8,
          children: [
            SvgPicture.asset(
              asset,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha: 0.9),
                .srcIn,
              ),
            ),
            Text(
              title,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: .bold,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ],
        );

  @override
  Widget build(BuildContext context) {
    final tickets = context.watch<TicketsBloc>().state;

    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 8,
        children: [
          Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            spacing: 16,
            children: [
              widget.isLoading
                  ? Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: context.colors.surfaceColor,
                            borderRadius: .circular(100),
                          ),
                        )
                        .animate(
                          autoPlay: true,
                          onComplete: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .shimmer(
                          duration: 2.seconds,
                          color: context.colors.iconColor.withValues(
                            alpha: 0.3,
                          ),
                        )
                  : AvatarGlow(
                      glowColor: context.colors.primaryColor,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: context.colors.iconColor,
                          shape: .circle,
                        ),
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
                children: widget.isLoading
                    ? List.generate(
                        3,
                        (index) =>
                            Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: context.colors.surfaceColor,
                                    borderRadius: .circular(8),
                                  ),
                                )
                                .animate(
                                  autoPlay: true,
                                  onComplete: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .shimmer(
                                  duration: 2.seconds,
                                  color: context.colors.iconColor.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                      )
                    : tickets is TicketsSuccess
                    ? List.generate(
                        tickets.tickets
                            .where(
                              (ticket) =>
                                  ticket.ticketCategoryId ==
                                  widget.ticketModel.categoryId,
                            )
                            .toList()
                            .take(3)
                            .toList()
                            .length,
                        (index) => UnconstrainedBox(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: .circular(8),
                              color: context.colors.surfaceColor,
                            ),
                            child: SvgPicture.network(
                              tickets.tickets
                                      .where(
                                        (ticket) =>
                                            ticket.ticketCategoryId ==
                                            widget.ticketModel.categoryId,
                                      )
                                      .toList()
                                      .take(3)
                                      .toList()[index]
                                      .ticketUserAvatarUrl ??
                                  '',
                            ),
                          ),
                        ),
                      )
                    : [SizedBox.shrink()],
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
                  BlocBuilder<TicketsBloc, TicketsState>(
                    builder: (context, ticketsState) {
                      final unresolvedTicketsCount =
                          ticketsState is TicketsSuccess
                          ? ticketsState.tickets
                                .where(
                                  (ticket) =>
                                      ticket.ticketCategoryId ==
                                      widget.ticketModel.categoryId,
                                )
                                .toList()
                                .length
                          : 0;

                      return widget.isLoading
                          ? Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: context.colors.surfaceColor,
                                    borderRadius: .circular(100),
                                  ),
                                )
                                .animate(
                                  autoPlay: true,
                                  onComplete: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .shimmer(
                                  duration: 2.seconds,
                                  color: context.colors.iconColor.withValues(
                                    alpha: 0.3,
                                  ),
                                )
                          : Text(
                              "$unresolvedTicketsCount",
                              style: context.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.colors.textBlack600,
                              ),
                            );
                    },
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: addMaterialContainerMotion(
              context,
              closedBuilder: (context, openWidget) => GestureDetector(
                onTap: () {
                  //  Open Details Page
                  openWidget();

                  showNavigation.value = false;
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const .only(bottom: 16, top: 16),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceColor,
                    borderRadius: .circular(24),
                  ),
                  child: Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: 500.milliSeconds,
                        child: widget.isLoading
                            ? SizedBox.shrink()
                            : ClipRRect(
                                borderRadius: .circular(24),
                                child: Image.asset(
                                  widget.ticketModel.categoryAsset,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: .cover,
                                ),
                              ),
                      ),

                      AnimatedSwitcher(
                        duration: 500.milliSeconds,
                        child: widget.isLoading
                            ? SizedBox.shrink()
                            : Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  margin: EdgeInsets.only(top: 100),
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
                      ),

                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: const .only(
                          left: 16,
                          right: 20,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          mainAxisAlignment: .end,
                          spacing: 16,
                          children: [
                            //  Title
                            widget.isLoading
                                ? Container(
                                        width: 200,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: context.colors.backgroundColor,
                                          borderRadius: .circular(100),
                                        ),
                                      )
                                      .animate(
                                        autoPlay: true,
                                        onComplete: (controller) =>
                                            controller.repeat(reverse: true),
                                      )
                                      .shimmer(
                                        duration: 2.seconds,
                                        color: context.colors.iconColor
                                            .withValues(alpha: 0.3),
                                      )
                                : Text(
                                    widget.ticketModel.categoryTitle,
                                    style: context.textTheme.titleLarge
                                        ?.copyWith(
                                          fontWeight: .bold,
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
                                  ),

                            BlocBuilder<TicketResolverCubit, Set<String>>(
                              builder: (context, resolvedTicketsState) {
                                return BlocBuilder<TicketsBloc, TicketsState>(
                                  builder: (context, ticketsState) {
                                    final totalTickets =
                                        ticketsState is TicketsSuccess
                                        ? ticketsState.tickets
                                              .where(
                                                (ticket) =>
                                                    ticket.ticketCategoryId ==
                                                    widget
                                                        .ticketModel
                                                        .categoryId,
                                              )
                                              .toList()
                                        : <TicketModel>[];

                                    final unresolvedTicketsCount =
                                        ticketsState is TicketsSuccess
                                        ? totalTickets.length -
                                              (resolvedTicketsState.where(
                                                (id) => totalTickets
                                                    .map((t) => t.ticketId)
                                                    .contains(id),
                                              )).length
                                        : 0;

                                    return Row(
                                      crossAxisAlignment: .center,
                                      mainAxisAlignment: .start,
                                      spacing: 24,
                                      children: [
                                        detailRow(
                                          asset: "assets/svg/ticket.svg",
                                          title:
                                              "${totalTickets.length} Tickets",
                                        ),
                                        detailRow(
                                          asset: "assets/svg/clock.svg",
                                          title:
                                              "$unresolvedTicketsCount Pending",
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onClosed: (_) async {
                showNavigation.value = true;
              },
              openBuilder: (context, closeWidget) =>
                  TicketCategoryDetailPage(categoryModel: widget.ticketModel),
            ),
          ),
        ],
      ),
    );
  }
}
