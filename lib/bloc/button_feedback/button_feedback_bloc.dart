import 'package:avaz_elements/model/button_feedback_info.dart';
import 'package:avaz_elements/model/button_feedback_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_feedback_event.dart';
part 'button_feedback_state.dart';

class ButtonFeedbackBloc
    extends Bloc<ButtonFeedbackEvent, ButtonFeedbackState> {
  ButtonFeedbackBloc()
      : super(ButtonFeedbackState(
            buttonFeedbackModel: ButtonFeedbackModel.defaultModel())) {
    on<OnTouchDown>((event, emit) {
      emit(state.copyWith(ButtonFeedbackModel(
          backgroundColor: ButtonFeedbackInfo.initialFeedbackColor,
          isLoaderEnabled: state.buttonFeedbackModel.isLoaderEnabled,
          showBorder: state.buttonFeedbackModel.showBorder)));
    });
    on<OnTouchUp>((event, emit) {
      emit(state.copyWith(ButtonFeedbackModel(
          backgroundColor: ButtonFeedbackInfo.finalFeedbackColor,
          isLoaderEnabled: state.buttonFeedbackModel.isLoaderEnabled,
          showBorder: state.buttonFeedbackModel.showBorder)));
    });
  }
}
