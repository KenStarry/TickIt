import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickit/core/presentation/components/custom_filled_button.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';

import '../../../../core/presentation/components/custom_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TicketDetailPage extends StatefulWidget {
  final TicketModel ticketModel;

  const TicketDetailPage({super.key, required this.ticketModel});

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  bool _ticketLoading = false;

  void _triggerAnimation() async {
    setState(() {
      _ticketLoading = true;
    });

    // Simulate a network request (e.g., 2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    // Reset back to button (optional)
    if (mounted) {
      setState(() {
        _ticketLoading = false;
      });
    }
  }

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
        child: Stack(
          children: [
            // ImageFiltered(
            //     imageFilter: .blur(sigmaX: 20, sigmaY: 20),
            //     child: CustomNetworkImage(url: widget.ticketModel.ticketCoverUrl)),
            CustomNetworkImage(url: widget.ticketModel.ticketCoverUrl),

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
                    Colors.black.withValues(alpha: 0.8), // Darker at bottom
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
                      height: context.screenHeight * 0.6,
                      // padding: const .only(left: 16, right: 16),
                      margin: const .only(left: 16, right: 16, bottom: 50),
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
                                    widget.ticketModel.ticketTitle,
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
                                            asset: "assets/svg/calendar.svg",
                                            title: "Date",
                                          ),
                                          Text(
                                            "Dec 31, 2025",
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(fontWeight: .w700),
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
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(fontWeight: .w700),
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
                                      borderRadius: BorderRadius.circular(16),
                                      color: context.colors.surfaceColor,
                                    ),
                                    child: Text(
                                      widget.ticketModel.ticketAmount
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
                                ? GestureDetector(
                                    onTap: () {
                                      _triggerAnimation();
                                    },
                                    child: AnimatedContainer(
                                      duration: 200.milliseconds,
                                      curve: Curves.easeIn,
                                      width: _ticketLoading ? 60 : 300,
                                      height: _ticketLoading ? 60 : 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
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
                                                  child: SpinKitSpinningLines(
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
                                                            FontWeight.w700,
                                                      ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  )
                                : CustomFilledButton(
                                    text: "Mark Resolved",
                                    // borderRadius: .only(
                                    //   bottomRight: Radius.circular(24),
                                    //   bottomLeft: Radius.circular(24),
                                    // ),
                                    onTap: () {
                                      //  Resolve
                                      //  Open the Ticket Preview screen
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: .topCenter,
                    child: Container(
                      width: double.infinity,
                      height: context.screenHeight * 0.4,
                      padding: const .only(left: 32, right: 32),
                      margin: const .only(top: 100),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: .circular(12),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: .circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 12,
                              spreadRadius: 4,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: CustomNetworkImage(
                          url: widget.ticketModel.ticketCoverUrl,
                          borderRadius: BorderRadius.circular(32),
                        ),
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
  }
}
