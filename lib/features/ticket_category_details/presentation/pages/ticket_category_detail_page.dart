import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tickit/core/presentation/components/custom_filled_button.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/ticket_receipt/presentation/pages/ticket_receipt.dart';
import 'package:tickit/features/ticket_category/domain/model/ticket_category_model.dart';
import 'package:tickit/features/tickets/presentation/components/ticket_card.dart';
import 'package:tickit/features/tickets/presentation/pages/ticket_detail_page.dart';

import '../../../../core/presentation/components/custom_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/presentation/components/material_motion.dart';
import '../../../tickets/domain/model/ticket_model.dart';
import '../../../tickets/presentation/bloc/tickets_bloc.dart';

class TicketCategoryDetailPage extends StatefulWidget {
  final TicketCategoryModel categoryModel;

  const TicketCategoryDetailPage({super.key, required this.categoryModel});

  @override
  State<TicketCategoryDetailPage> createState() =>
      _TicketCategoryDetailPageState();
}

class _TicketCategoryDetailPageState extends State<TicketCategoryDetailPage> {
  bool _ticketLoading = false;

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
        style: context.textTheme.bodySmall?.copyWith(fontWeight: .bold),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: true
            ? CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    leading: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: UnconstrainedBox(
                        child: Container(
                          width: 45,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.colors.backgroundColor,
                          ),
                          child: SvgPicture.asset(
                            "assets/svg/arrow_back.svg",
                            width: 16,
                            height: 16,
                            colorFilter: ColorFilter.mode(
                              context.colors.iconColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: context.colors.backgroundColor,
                    surfaceTintColor: context.colors.backgroundColor,
                    expandedHeight: 350,
                    pinned: true,
                    stretch: true,
                    flexibleSpace: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                            // Current height of the SliverAppBar
                            final currentHeight = constraints.biggest.height;

                            // Collapsed when close to kToolbarHeight (56)
                            final collapsed =
                                currentHeight <=
                                kToolbarHeight +
                                    MediaQuery.of(context).padding.top +
                                    5;

                            return FlexibleSpaceBar(
                              collapseMode: CollapseMode.pin,
                              titlePadding: EdgeInsets.only(left: 70),
                              title: collapsed
                                  ? Container(
                                      width: double.infinity,
                                      height: kToolbarHeight,
                                      color: context.colors.backgroundColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.categoryModel.categoryTitle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              background: Container(
                                width: double.infinity,
                                height: 300,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(border: null),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(
                                            widget.categoryModel.categoryAsset,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: .cover,
                                          )
                                          .animate(
                                            autoPlay: true,
                                            onComplete: (controller) =>
                                                controller.repeat(
                                                  reverse: true,
                                                ),
                                          )
                                          .scale(
                                            begin: Offset(1, 1),
                                            end: Offset(1.3, 1.3),
                                            duration: Duration(
                                              milliseconds: 7000,
                                            ),
                                          ),

                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          margin: EdgeInsets.only(top: 200),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                context.colors.backgroundColor
                                                    .withValues(alpha: 0.0),
                                                // fully transparent top
                                                context.colors.backgroundColor
                                                    .withValues(alpha: 0.15),
                                                // gentle lift
                                                context.colors.backgroundColor
                                                    .withValues(alpha: 0.45),
                                                // soft smoke start
                                                context.colors.backgroundColor
                                                    .withValues(alpha: 0.75),
                                                // warm mid haze
                                                context.colors.backgroundColor
                                                    .withValues(alpha: 0.95),
                                                // almost solid
                                                context.colors.backgroundColor
                                                    .withValues(alpha: 1.0),
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

                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            border: null,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget
                                                    .categoryModel
                                                    .categoryTitle,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(fontSize: 32),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 32)),

                  BlocBuilder<TicketsBloc, TicketsState>(
                    builder: (context, ticketsState) {
                      final totalTickets = ticketsState is TicketsSuccess
                          ? ticketsState.tickets
                                .where(
                                  (ticket) =>
                                      ticket.ticketCategoryId ==
                                      widget.categoryModel.categoryId,
                                )
                                .toList()
                          : <TicketModel>[];

                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => true
                              ? addMaterialContainerMotion(
                                  context,
                                  closedBuilder: (context, openWidget) =>
                                      TicketCard(
                                        ticketModel: totalTickets[index],
                                        onTap: () {
                                          openWidget();
                                        },
                                      ),
                                  onClosed: (_) async {},
                                  openBuilder: (context, closeWidget) =>
                                      TicketDetailPage(
                                        ticketModel: totalTickets[index],
                                      ),
                                )
                              : TicketCard(
                                  ticketModel: totalTickets[index],
                                  onTap: () {},
                                ),
                          childCount: 10,
                        ),
                      );
                    },
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              )
            : Stack(
                children: [
                  // CustomNetworkImage(url: widget.categoryModel.categoryCoverUrl),
                  Image.asset(
                    widget.categoryModel.categoryAsset,
                    width: double.infinity,
                    height: double.infinity,
                    fit: .cover,
                  ),

                  BackdropFilter(
                    filter: .blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(color: Colors.transparent),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.4), // Lighter at top
                          Colors.black.withValues(
                            alpha: 0.8,
                          ), // Darker at bottom
                        ],
                      ),
                    ),
                  ),

                  /// Content
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: .circular(12),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: .bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: context.screenHeight * 0.7,
                            // padding: const .only(left: 16, right: 16),
                            margin: const .only(
                              left: 16,
                              right: 16,
                              bottom: 50,
                            ),
                            decoration: BoxDecoration(
                              color: context.colors.backgroundColor,
                              borderRadius: .circular(24),
                            ),
                            child: Column(
                              mainAxisSize: .max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const .only(
                                      left: 24.0,
                                      right: 24,
                                      top: 150,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: .center,
                                      mainAxisAlignment: .spaceEvenly,
                                      spacing: 32,
                                      children: [
                                        Text(
                                          widget.categoryModel.categoryTitle,
                                          textAlign: TextAlign.center,
                                          style: context.textTheme.titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 28,
                                              ),
                                        ),

                                        Row(
                                          // spacing: 32,
                                          crossAxisAlignment: .center,
                                          mainAxisAlignment: .spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment: .center,
                                              crossAxisAlignment: .start,
                                              spacing: 16,
                                              children: [
                                                detailRow(
                                                  asset:
                                                      "assets/svg/calendar.svg",
                                                  title: "Date",
                                                ),
                                                Text(
                                                  "Dec 31, 2025",
                                                  style: context
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        fontWeight: .w700,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: .center,
                                              crossAxisAlignment: .start,
                                              spacing: 16,
                                              children: [
                                                detailRow(
                                                  asset: "assets/svg/clock.svg",
                                                  title: "Time",
                                                ),
                                                Text(
                                                  "11:00PM",
                                                  style: context
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        fontWeight: .w700,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            color: context.colors.surfaceColor,
                                          ),
                                          child: Text(
                                            widget.categoryModel.categoryAmount
                                                .toCurrency(),
                                            textAlign: TextAlign.center,
                                            style: context.textTheme.titleLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 28,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const .only(
                                    left: 16.0,
                                    right: 16,
                                    bottom: 32,
                                  ),
                                  child: true
                                      ? addMaterialContainerMotion(
                                          context,
                                          closedBuilder: (context, openWidget) => GestureDetector(
                                            onTap: () async {
                                              // _triggerAnimation();

                                              setState(() {
                                                _ticketLoading = true;
                                              });

                                              // Simulate a network request (e.g., 2 seconds)
                                              await Future.delayed(
                                                const Duration(seconds: 2),
                                              );

                                              /// Start the morphing
                                              openWidget();

                                              // Reset back to button (optional)
                                              if (mounted) {
                                                setState(() {
                                                  _ticketLoading = false;
                                                });
                                              }
                                            },
                                            child: AnimatedContainer(
                                              duration: 200.milliseconds,
                                              curve: Curves.easeIn,
                                              width: _ticketLoading ? 60 : 300,
                                              height: _ticketLoading ? 60 : 55,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: _ticketLoading
                                                    ? context
                                                          .colors
                                                          .surfaceColor
                                                    : context
                                                          .colors
                                                          .primaryColor,
                                              ),
                                              child: Center(
                                                child: AnimatedSwitcher(
                                                  duration: 300.milliseconds,
                                                  switchInCurve: Curves.easeIn,
                                                  switchOutCurve:
                                                      Curves.easeOut,
                                                  child: _ticketLoading
                                                      ? UnconstrainedBox(
                                                          child:
                                                              SpinKitSpinningLines(
                                                                color: context
                                                                    .colors
                                                                    .primaryColor,
                                                                size: 45,
                                                              ),
                                                        )
                                                      : Text(
                                                          "Mark Resolved",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .copyWith(
                                                                color: context
                                                                    .colors
                                                                    .onPrimaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onClosed: (_) async {},
                                          openBuilder: (context, closeWidget) =>
                                              TicketReceipt(
                                                ticketModel:
                                                    widget.categoryModel,
                                              ),
                                        )
                                      : GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              _ticketLoading = true;
                                            });

                                            // Simulate a network request (e.g., 2 seconds)
                                            await Future.delayed(
                                              const Duration(seconds: 2),
                                            );

                                            // Reset back to button (optional)
                                            if (mounted) {
                                              setState(() {
                                                _ticketLoading = false;
                                              });
                                            }
                                          },
                                          child: AnimatedContainer(
                                            duration: 200.milliseconds,
                                            curve: Curves.easeIn,
                                            width: _ticketLoading ? 60 : 300,
                                            height: _ticketLoading ? 60 : 55,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: _ticketLoading
                                                  ? context.colors.surfaceColor
                                                  : context.colors.primaryColor,
                                            ),
                                            child: Center(
                                              child: AnimatedSwitcher(
                                                duration: 300.milliseconds,
                                                switchInCurve: Curves.easeIn,
                                                switchOutCurve: Curves.easeOut,
                                                child: _ticketLoading
                                                    ? UnconstrainedBox(
                                                        child:
                                                            SpinKitSpinningLines(
                                                              color: context
                                                                  .colors
                                                                  .primaryColor,
                                                              size: 45,
                                                            ),
                                                      )
                                                    : Text(
                                                        "Mark Resolved",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              color: context
                                                                  .colors
                                                                  .onPrimaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Align(
                        //   alignment: .topCenter,
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: context.screenHeight * 0.3,
                        //     padding: const .only(left: 32, right: 32),
                        //     margin: const .only(top: 100),
                        //     decoration: BoxDecoration(
                        //       color: Colors.transparent,
                        //       borderRadius: .circular(12),
                        //     ),
                        //     child: Container(
                        //       width: double.infinity,
                        //       height: double.infinity,
                        //       decoration: BoxDecoration(
                        //         borderRadius: .circular(32),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withValues(alpha: 0.2),
                        //             blurRadius: 12,
                        //             spreadRadius: 4,
                        //             offset: Offset(0, 8),
                        //           ),
                        //         ],
                        //       ),
                        //       child: true ? ClipRRect(
                        //         borderRadius: .circular(24),
                        //         child: Image.asset(
                        //           widget.categoryModel.categoryAsset,
                        //           width: double.infinity,
                        //           height: double.infinity,
                        //           fit: .cover,
                        //         ),
                        //       ) : CustomNetworkImage(
                        //         url: widget.categoryModel.categoryCoverUrl,
                        //         borderRadius: BorderRadius.circular(32),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
