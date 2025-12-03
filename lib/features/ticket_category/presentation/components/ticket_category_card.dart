import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickit/core/presentation/components/custom_network_image.dart';
import 'package:tickit/features/ticket_detail/presentation/pages/ticket_detail_page.dart';
import 'package:tickit/features/ticket_category/domain/model/ticket_model.dart';

import '../../../../core/presentation/components/material_motion.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

class TicketCategoryCard extends StatefulWidget {
  final TicketCategoryModel ticketModel;

  const TicketCategoryCard({super.key, required this.ticketModel});

  @override
  State<TicketCategoryCard> createState() => _TicketCategoryCardState();
}

class _TicketCategoryCardState extends State<TicketCategoryCard> {
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
    return Container(
      width: double.infinity,
      height: 280,
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
              AvatarGlow(
                glowColor: context.colors.primaryColor,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(color: context.colors.iconColor,
                  shape: .circle),
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
                        borderRadius: .circular(8),
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
            ],
          ),
          Expanded(
            child: addMaterialContainerMotion(
                    context,
                    closedBuilder: (context, openWidget) => GestureDetector(
                      onTap: () {
                        //  Open Details Page
                        openWidget();
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const .only(bottom: 16, top: 16),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: .circular(24),
                              child: Image.asset(widget.ticketModel.categoryAsset,
                              width: double.infinity,
                              height: double.infinity,
                              fit: .cover,),
                            ),
                            // CustomNetworkImage(
                            //   url: widget.ticketModel.ticketCoverUrl,
                            //   borderRadius: .circular(24),
                            // ),

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
                              padding: const .symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: .start,
                                mainAxisAlignment: .end,
                                spacing: 16,
                                children: [
                                  //  Title
                                  Text(
                                    widget.ticketModel.categoryTitle,
                                    style: context.textTheme.titleLarge
                                        ?.copyWith(
                                          fontWeight: .bold,
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                  ),

                                  Row(
                                    crossAxisAlignment: .center,
                                    mainAxisAlignment: .start,
                                    spacing: 24,
                                    children: [
                                      detailRow(
                                        asset: "assets/svg/login.svg",
                                        title: "5 Tickets",
                                      ),
                                      detailRow(
                                        asset: "assets/svg/clock.svg",
                                        title: "Pending",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onClosed: (_) async {},
                    openBuilder: (context, closeWidget) =>
                        TicketDetailPage(ticketModel: widget.ticketModel),
                  )
          ),
        ],
      ),
    );
  }
}
