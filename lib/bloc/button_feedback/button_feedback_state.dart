part of 'button_feedback_bloc.dart';

class ButtonFeedbackState extends Equatable {
  final ButtonFeedbackModel buttonFeedbackModel;
  const ButtonFeedbackState({required this.buttonFeedbackModel});

  ButtonFeedbackState copyWith(ButtonFeedbackModel? buttonFeedbackModel) {
    return ButtonFeedbackState(
        buttonFeedbackModel: buttonFeedbackModel ?? this.buttonFeedbackModel);
  }

  @override
  List<Object> get props => [buttonFeedbackModel];
}
