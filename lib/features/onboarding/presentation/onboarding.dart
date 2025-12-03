import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickit/core/presentation/components/custom_filled_button.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(),
              child: Image.asset(
                "assets/images/bg3.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 50,
                top: 100,
              ),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .start,
                spacing: 24,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .start,
                      spacing: 24,
                      children: [
                        Text(
                          "Hey\nready for Tonight?",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontSize: 50, color: Colors.white),
                        ),
                        Text(
                          "Resolve Tickets with ease",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .center,
                    children: [
                      AvatarGlow(
                        glowColor: context.colors.primaryColor,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: .circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4)
                              )
                            ]
                          ),
                          child: UnconstrainedBox(
                            child: SvgPicture.asset(
                              "assets/svg/login.svg",
                              width: 42,
                              height: 42,
                              colorFilter: ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // CustomFilledButton(text: "Login", onTap: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
