import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/extensions/context_extensions.dart';

class IslandFeedbackInfo extends StatefulWidget {
  final String message;

  const IslandFeedbackInfo({super.key, required this.message});

  @override
  State<IslandFeedbackInfo> createState() => _IslandFeedbackInfoState();
}

class _IslandFeedbackInfoState extends State<IslandFeedbackInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: double.infinity,
        // height: 50,
        margin: const EdgeInsets.only(top: 50, left: 24, right: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.colors.surfaceContainerHighest,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/svg/info_outlined.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                  context.colors.primaryColor, BlendMode.srcIn),
            ),
            Expanded(
              child: Text(
                widget.message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.textBlack900),
              ),
            )
          ],
        ));
  }
}
