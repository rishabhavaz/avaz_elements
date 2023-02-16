import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/button_feedback.dart';

part 'button_feedback_state.dart';

class ButtonFeedbackCubit extends Cubit<ButtonFeedbackState> {
  ButtonFeedbackCubit()
      : super(const ButtonFeedbackState(
          feedback: ButtonFeedback()
        ));


changeBorderColor(Color color) {
    emit(state.copyWith(
        feedback: ButtonFeedback(borderColor: color)));
  }
}
