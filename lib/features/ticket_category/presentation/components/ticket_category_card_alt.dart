import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickit/core/presentation/components/avatar_overlays.dart';
import 'package:tickit/core/presentation/components/custom_network_image.dart';
import 'package:tickit/features/dashboard/presentation/components/global_overlay.dart';
import 'package:tickit/features/ticket_category_details/presentation/pages/ticket_category_detail_page.dart';
import 'package:tickit/features/ticket_category/domain/model/ticket_category_model.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';
import 'package:tickit/features/tickets/presentation/bloc/tickets_bloc.dart';

import '../../../../core/presentation/components/material_motion.dart';
import '../../../../core/utils/extensions/context_extensions.dart';
import '../../../tickets/presentation/bloc/ticket_resolver_cubit.dart';

class TicketCategoryCardAlt extends StatefulWidget {
  final TicketCategoryModel ticketModel;

  const TicketCategoryCardAlt({super.key, required this.ticketModel});

  @override
  State<TicketCategoryCardAlt> createState() => _TicketCategoryCardAltState();
}

class _TicketCategoryCardAltState extends State<TicketCategoryCardAlt> {
  Widget detailRow({required String asset, required String title}) => Row(
    crossAxisAlignment: .center,
    mainAxisAlignment: .start,
    spacing: 8,
    children: [
      SvgPicture.asset(
        asset,
        width: 16,
        height: 16,
        colorFilter: ColorFilter.mode(
          context.colors.iconColor.withValues(alpha: 0.9),
          .srcIn,
        ),
      ),
      Text(
        title,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: .bold,
          color: context.colors.iconColor.withValues(alpha: 0.9),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final tickets = context.watch<TicketsBloc>().state;

    return addMaterialContainerMotion(
      context,
      closedBuilder: (context, openWidget) => GestureDetector(
        onTap: () {
          //  Open Details Page
          openWidget();

          showNavigation.value = false;
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            spacing: 8,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const .only(bottom: 16, top: 16),
                child: ClipRRect(
                  borderRadius: .circular(24),
                  child: Image.asset(
                    widget.ticketModel.categoryAsset,
                    width: double.infinity,
                    height: double.infinity,
                    fit: .cover,
                  ),
                ),
              ),

              /// Content
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const .only(left: 16, top: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      //  Title
                      Text(
                        widget.ticketModel.categoryTitle,
                        style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: .bold,
                            fontSize: 20,
                            color: context.colors.textBlack800
                        ),
                      ),

                      BlocBuilder<TicketResolverCubit, Set<String>>(
                        builder: (context, resolvedTicketsState) {
                          return BlocBuilder<TicketsBloc, TicketsState>(
                            builder: (context, ticketsState) {
                              final totalTickets = ticketsState is TicketsSuccess
                                  ? ticketsState.tickets
                                  .where(
                                    (ticket) =>
                                ticket.ticketCategoryId ==
                                    widget.ticketModel.categoryId,
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
                                spacing: 16,
                                children: [
                                  Expanded(child: tickets is TicketsSuccess
                                      ? AvatarOverlays(
                                    isSvg: true,
                                    label: "${totalTickets.length}+ Tickets",
                                    labelTextStyling: context.textTheme.bodySmall?.copyWith(
                                      fontWeight: .bold,
                                      color: context.colors.iconColor.withValues(alpha: 0.9),
                                    ),
                                    avatarUrls: tickets.tickets
                                        .where(
                                          (ticket) =>
                                      ticket.ticketCategoryId ==
                                          widget.ticketModel.categoryId,
                                    )
                                        .toList()
                                        .take(3)
                                        .map((t) => t.ticketUserAvatarUrl)
                                        .whereType<String>()
                                        .toList(),
                                  )
                                      : SizedBox.shrink()),

                                  Row(
                                    crossAxisAlignment: .center,
                                    spacing: 16,
                                    children: [
                                      // detailRow(
                                      //   asset: "assets/svg/ticket.svg",
                                      //   title: "${totalTickets.length}",
                                      // ),
                                      detailRow(
                                        asset: "assets/svg/clock.svg",
                                        title: "$unresolvedTicketsCount Pending",
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
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
    );
  }
}
