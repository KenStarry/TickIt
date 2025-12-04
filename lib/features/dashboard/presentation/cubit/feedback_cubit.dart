import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enum/feedback_enum.dart';

class FeedbackCubit extends Cubit<FeedbackMessage> {
  FeedbackCubit()
      : super(FeedbackMessage(
            message: '',
            visible: false,
            type: FeedbackType.info,
            duration: const Duration(seconds: 2)));

  void show(String message,
      {FeedbackType type = FeedbackType.info,
      Duration duration = const Duration(seconds: 3)}) {
    emit(FeedbackMessage(
        message: message, visible: true, type: type, duration: duration));

    Future.delayed(
        duration,
        () => emit(FeedbackMessage(
            message: '',
            visible: false,
            type: FeedbackType.info,
            duration: const Duration(seconds: 2))));
  }
}
