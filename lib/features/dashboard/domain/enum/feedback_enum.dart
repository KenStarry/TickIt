import 'package:flutter/material.dart';

import '../../presentation/components/island_feedback_info.dart';
import '../../presentation/components/island_feedback_short.dart';
import '../../presentation/components/island_feedback_success.dart';

enum FeedbackType {
  success,
  error,
  info,
  short,
  warning;

  Widget feedbackWidget(String message) => switch (this) {
        success => IslandFeedbackSuccess(message: message),
        error => IslandFeedbackInfo(message: message),
        info => IslandFeedbackInfo(message: message),
        short => IslandFeedbackShort(message: message),
        warning => IslandFeedbackInfo(message: message),
      };
}

class FeedbackMessage {
  final String message;
  final FeedbackType type;
  final bool visible;
  final Duration duration;

  const FeedbackMessage({
    required this.message,
    this.type = FeedbackType.info,
    this.visible = false,
    this.duration = const Duration(seconds: 2),
  });

  FeedbackMessage copyWith({
    String? message,
    FeedbackType? type,
    bool? visible,
    Duration? duration,
  }) {
    return FeedbackMessage(
      message: message ?? this.message,
      type: type ?? this.type,
      visible: visible ?? this.visible,
      duration: duration ?? this.duration,
    );
  }
}
