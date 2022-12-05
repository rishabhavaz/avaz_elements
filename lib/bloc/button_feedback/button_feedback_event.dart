part of 'button_feedback_bloc.dart';

abstract class ButtonFeedbackEvent extends Equatable {
  const ButtonFeedbackEvent();

  @override
  List<Object> get props => [];
}

class OnTouchDown extends ButtonFeedbackEvent {}

class OnTouchUp extends ButtonFeedbackEvent {}

class DoTouchAction extends ButtonFeedbackEvent {}
