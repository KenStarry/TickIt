import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/extensions/context_extensions.dart';

class IslandFeedbackSuccess extends StatefulWidget {
  final String message;

  const IslandFeedbackSuccess({super.key, required this.message});

  @override
  State<IslandFeedbackSuccess> createState() => _IslandFeedbackSuccessState();
}

class _IslandFeedbackSuccessState extends State<IslandFeedbackSuccess> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        // height: 60,
        margin: const EdgeInsets.only(top: 50, left: 24, right: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: context.colors.surfaceContainerHighest,
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/svg/check_badge_outlined.svg",
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                      context.colors.primaryColor, BlendMode.srcIn),
                )
                    .animate(autoPlay: true)
                    .fadeIn(duration: Duration(milliseconds: 350))
                    .moveY(
                        begin: 50,
                        end: 0,
                        duration: Duration(milliseconds: 350),
                        curve: Curves.ease)
                    .then()
                    .moveY(begin: -5, curve: Curves.ease),
                Expanded(
                  child: Text(
                    widget.message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.textBlack900),
                  )
                      .animate(
                          autoPlay: true, delay: Duration(milliseconds: 150))
                      .fadeIn(duration: Duration(milliseconds: 350))
                      .moveY(
                          begin: 50,
                          end: 0,
                          duration: Duration(milliseconds: 350),
                          curve: Curves.ease)
                      .then()
                      .moveY(begin: -5, curve: Curves.ease),
                )
              ],
            ),
          ],
        ));
  }
}
