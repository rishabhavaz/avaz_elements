import 'package:avaz_elements/settings/model/settings_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsModel settingsModel = SettingsModel();
  SettingsBloc() : super(SettingsState(settingsModel: SettingsModel())) {
    on<UpdateSettings>((event, emit) {
      if (event.key == SettingKeys.enableScanning) {
        emit(state.copyWith(
            settingsModel:
                settingsModel.copyWith(enableScanning: event.value)));
      }
      if (event.key == SettingKeys.showBorderFeedbankOnHover) {
        emit(state.copyWith(
            settingsModel: settingsModel.copyWith(
                showBorderFeedbankOnHover: event.value)));
      }
      if (event.key == SettingKeys.loaderEnabled) {
        emit(state.copyWith(
            settingsModel: settingsModel.copyWith(loaderEnabled: event.value)));
      }
      if (event.key == SettingKeys.showBorderFeedbankOnHover) {
        emit(state.copyWith(
            settingsModel: settingsModel.copyWith(
                showBorderFeedbankOnHover: event.value)));
      }
      if (event.key == SettingKeys.showFeedbackOnHover) {
        emit(state.copyWith(
            settingsModel:
                settingsModel.copyWith(showFeedbackOnHover: event.value)));
      }
      if (event.key == SettingKeys.touchReleaseType) {
        emit(state.copyWith(
            settingsModel:
                settingsModel.copyWith(touchReleaseType: event.value)));
      }
    });
  }
}
