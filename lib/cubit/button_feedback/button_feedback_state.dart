part of 'button_feedback_cubit.dart';

class ButtonFeedbackState extends Equatable {
  final ButtonFeedback feedback;
  const ButtonFeedbackState({required this.feedback});

  @override
  List<Object> get props => [feedback];

  ButtonFeedbackState copyWith({ButtonFeedback? feedback}) {
    return ButtonFeedbackState(feedback: feedback ?? this.feedback);
  }
}
