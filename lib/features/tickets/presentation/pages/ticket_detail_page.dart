import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tickit/core/presentation/components/custom_filled_button.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/tickets/domain/model/ticket_model.dart';

import '../../../../core/presentation/components/custom_network_image.dart';
import '../../../../core/presentation/components/material_motion.dart';
import '../bloc/ticket_resolver_cubit.dart';

class TicketDetailPage extends StatefulWidget {
  final TicketModel ticketModel;

  const TicketDetailPage({super.key, required this.ticketModel});

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  bool _ticketLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      appBar: AppBar(
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
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: .circular(32),
                  color: context.colors.surfaceColor,
                ),
                child: Column(
                  mainAxisSize: .min,
                  spacing: 32,
                  children: [
                    UnconstrainedBox(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: .circular(8),
                          color: context.colors.surfaceColor,
                        ),
                        child: SvgPicture.network(
                          widget.ticketModel.ticketUserAvatarUrl ?? '',
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      spacing: 16,
                      children: [
                        Text(
                          widget.ticketModel.ticketTitle ?? '',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleSmall?.copyWith(),
                        ),

                        Text(
                          widget.ticketModel.ticketBody ?? '',
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(),
                        ),
                      ],
                    ),

                    BlocBuilder<TicketResolverCubit, Set<String>>(
                      builder: (context, resolvedTicketsState) {
                        return GestureDetector(
                          onTap: () async {
                            // _triggerAnimation();

                            setState(() {
                              _ticketLoading = true;
                            });

                            context.read<TicketResolverCubit>().toggleResolve(
                              widget.ticketModel.ticketId ?? '',
                            );

                            // Simulate a network request (e.g., 2 seconds)
                            await Future.delayed(const Duration(seconds: 2));

                            //  Update
                            context.pop();

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
                              borderRadius: BorderRadius.circular(100),
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
                                          color: context.colors.primaryColor,
                                          size: 45,
                                        ),
                                      )
                                    : Text(
                                        resolvedTicketsState.contains(
                                              widget.ticketModel.ticketId,
                                            )
                                            ? "Resolved"
                                            : "Resolve",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color:
                                                  context.colors.onPrimaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // CustomFilledButton(
                    //   text: "Resolve",
                    //   onTap: () {
                    //     //  Add this id to the list of resolved tickets
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
