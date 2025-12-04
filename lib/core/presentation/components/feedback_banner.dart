import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../features/dashboard/domain/enum/feedback_enum.dart';
import '../../../features/dashboard/presentation/cubit/feedback_cubit.dart';
import '../../utils/extensions/context_extensions.dart';

class FeedbackBanner extends StatefulWidget {
  const FeedbackBanner({super.key});

  @override
  State<FeedbackBanner> createState() => _FeedbackBannerState();
}

class _FeedbackBannerState extends State<FeedbackBanner> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController =
        ConfettiController(duration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedbackCubit, FeedbackMessage>(
      builder: (context, feedback) {
        return IgnorePointer(
          ignoring: true,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Visibility(
                    visible: feedback.visible,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirectionality: BlastDirectionality.explosive,
                        emissionFrequency: 0.8,
                        numberOfParticles: 15,
                        maxBlastForce: 15,
                        minBlastForce: 5,
                        gravity: 0.1,
                        particleDrag: 0.05,
                        createParticlePath: (_) => buildCirclePath(4),
                        colors: [
                          context.colors.primaryColor,
                          context.colors.secondary,
                          context.colors.secondaryContainer,
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: feedback.visible
                        ? feedback.type
                            .feedbackWidget(feedback.message)
                            .animate(autoPlay: true)
                            .fadeIn(duration: Duration(milliseconds: 230))
                            .moveY(
                                begin: -50,
                                end: 0,
                                duration: Duration(milliseconds: 230),
                                curve: Curves.ease)
                            .then()
                            .moveY(begin: 10, curve: Curves.ease)
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, FeedbackMessage state) {
        if (state.visible && state.type == FeedbackType.success) {
          _confettiController.play();
        }
      },
    );
  }
}

Path buildCirclePath([double radius = 6]) =>
    Path()..addOval(Rect.fromCircle(center: Offset.zero, radius: radius));