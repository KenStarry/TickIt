import 'package:avatar_glow/avatar_glow.dart';
import 'package:carousel_slider/carousel_controller.dart' as slider;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tickit/core/presentation/components/material_motion.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';

import '../../auth/presentation/pages/login/login.dart';
import '../../dashboard/presentation/components/global_overlay.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late final slider.CarouselSliderController _carouselController;
  int activeIndex = 0;

  AnimationController? _titleAnimation;
  AnimationController? _subTitleAnimation;
  AnimationController? _loginBtnAnimation;

  @override
  void initState() {
    super.initState();

    _titleAnimation = AnimationController(vsync: this);
    _subTitleAnimation = AnimationController(vsync: this);
    _loginBtnAnimation = AnimationController(vsync: this);

    _carouselController = slider.CarouselSliderController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showNavigation.value = false;
    });
  }

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
              child:
                  Image.asset(
                        "assets/images/bg3.png",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                      .animate(
                        autoPlay: true,
                        onComplete: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .scaleXY(
                        end: 1.2,
                        duration: 8.seconds,
                        curve: Curves.ease,
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
                              "Ticket\nresolution made Easy!",
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontSize: 50, color: Colors.white),
                            )
                            .animate(autoPlay: true, delay: 500.milliseconds)
                            .moveY(
                              begin: 100,
                              end: -20,
                              duration: 500.milliseconds,
                              curve: Curves.ease,
                            )
                            .fadeIn(
                              duration: 500.milliseconds,
                              curve: Curves.ease,
                            )
                            .then()
                            .moveY(
                              duration: 500.milliseconds,
                              begin: 0,
                              end: 20,
                              curve: Curves.ease,
                            )
                            .animate(
                              autoPlay: false,
                              controller: _titleAnimation,
                            )
                            .moveY(
                              duration: 300.milliseconds,
                              begin: 0,
                              end: 20,
                              curve: Curves.ease,
                            )
                            .then()
                            .moveY(
                              begin: 0,
                              end: -100,
                              duration: 300.milliseconds,
                              curve: Curves.ease,
                            )
                            .fadeOut(
                              duration: 300.milliseconds,
                              curve: Curves.ease,
                            ),
                        Text(
                              "Resolve Tickets with ease",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                            )
                            .animate(autoPlay: true, delay: 700.milliseconds)
                            .moveY(
                              begin: 100,
                              end: -20,
                              duration: 500.milliseconds,
                              curve: Curves.ease,
                            )
                            .fadeIn(
                              duration: 500.milliseconds,
                              curve: Curves.ease,
                            )
                            .then()
                            .moveY(
                              duration: 500.milliseconds,
                              begin: 0,
                              end: 20,
                              curve: Curves.ease,
                            )
                            .animate(
                              autoPlay: false,
                              controller: _subTitleAnimation,
                            )
                            .moveY(
                              duration: 300.milliseconds,
                              begin: 0,
                              end: 20,
                              curve: Curves.ease,
                            )
                            .then()
                            .moveY(
                              begin: 0,
                              end: -100,
                              duration: 300.milliseconds,
                              curve: Curves.ease,
                            )
                            .fadeOut(
                              duration: 300.milliseconds,
                              curve: Curves.ease,
                            ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .center,
                    spacing: 24,
                    children: [
                      Text(
                            "Start Here",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                          )
                          .animate(autoPlay: true, delay: 1000.milliseconds)
                          .moveX(
                            begin: 100,
                            end: -20,
                            duration: 500.milliseconds,
                            curve: Curves.ease,
                          )
                          .fadeIn(
                            duration: 500.milliseconds,
                            curve: Curves.ease,
                          )
                          .then()
                          .moveX(
                            duration: 500.milliseconds,
                            begin: 0,
                            end: 20,
                            curve: Curves.ease,
                          )
                          .animate(
                            autoPlay: false,
                            controller: _subTitleAnimation,
                          )
                          .moveY(
                            duration: 300.milliseconds,
                            begin: 0,
                            end: 20,
                            curve: Curves.ease,
                          )
                          .then()
                          .moveY(
                            begin: 0,
                            end: -100,
                            duration: 300.milliseconds,
                            curve: Curves.ease,
                          )
                          .fadeOut(
                            duration: 300.milliseconds,
                            curve: Curves.ease,
                          ),

                      AvatarGlow(
                        glowColor: Colors.white,
                        startDelay: 1500.milliseconds,
                        child: addMaterialContainerMotion(
                          context,
                          closedBuilder: (context, openWidget) =>
                              GestureDetector(
                                onTap: () async {
                                  _loginBtnAnimation?.forward(from: 0.0);
                                  _titleAnimation?.forward(from: 0.0);
                                  await Future.delayed(
                                    100.milliseconds,
                                    () =>
                                        _subTitleAnimation?.forward(from: 0.0),
                                  );

                                  Future.delayed(
                                    300.milliseconds,
                                    () => openWidget(),
                                  );

                                  Future.delayed(
                                    300.milliseconds,
                                    () => context.goNamed('tickets'),
                                  );
                                },
                                child:
                                    Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius: .circular(100),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(
                                                  alpha: 0.5,
                                                ),
                                                blurRadius: 12,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: UnconstrainedBox(
                                            child: SvgPicture.asset(
                                              "assets/svg/login.svg",
                                              width: 40,
                                              height: 40,
                                              colorFilter: ColorFilter.mode(
                                                Colors.black,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                        )
                                        .animate(autoPlay: true, delay: 1000.milliseconds)
                                        .moveX(
                                      begin: 100,
                                      end: -20,
                                      duration: 500.milliseconds,
                                      curve: Curves.ease,
                                    )
                                        .fadeIn(
                                      duration: 500.milliseconds,
                                      curve: Curves.ease,
                                    )
                                        .then()
                                        .moveX(
                                      duration: 500.milliseconds,
                                      begin: 0,
                                      end: 20,
                                      curve: Curves.ease,
                                    )
                                        .animate(
                                          autoPlay: false,
                                          controller: _loginBtnAnimation,
                                        )
                                        .scaleXY(
                                          end: 0.8,
                                          duration: 400.milliseconds,
                                          curve: Curves.easeOut,
                                        )
                                        .then()
                                        .scaleXY(
                                          end: 1.2,
                                          duration: 400.milliseconds,
                                          curve: Curves.easeIn,
                                        )
                                        .then()
                                        .scaleXY(
                                          end: 1.0,
                                          duration: 400.milliseconds,
                                          curve: Curves.easeIn,
                                        ),
                              ),
                          onClosed: (_) async {
                            _titleAnimation?.reverse(from: 1.0);
                            await Future.delayed(
                              100.milliseconds,
                              () => _subTitleAnimation?.reverse(from: 1.0),
                            );
                          },
                          openBuilder: (context, closeWidget) => Login(),
                        ).animate(autoPlay: true, delay: 1000.milliseconds)
                            .moveX(
                          begin: 100,
                          end: -20,
                          duration: 500.milliseconds,
                          curve: Curves.ease,
                        )
                            .fadeIn(
                          duration: 500.milliseconds,
                          curve: Curves.ease,
                        )
                            .then()
                            .moveX(
                          duration: 500.milliseconds,
                          begin: 0,
                          end: 20,
                          curve: Curves.ease,
                        ),
                      )
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
