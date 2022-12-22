part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final SettingsModel settingsModel;
  const SettingsState({required this.settingsModel});

  @override
  List<Object> get props => [settingsModel];

  SettingsState copyWith({required SettingsModel settingsModel}) {
    return SettingsState(
        settingsModel: settingsModel.copyWith(
            enableScanning: settingsModel.enableScanning,
            loaderEnabled: settingsModel.loaderEnabled,
            showBorderFeedbankOnHover: settingsModel.showBorderFeedbankOnHover,
            showFeedbackOnHover: settingsModel.showBorderFeedbankOnHover,
            touchReleaseType: settingsModel.touchReleaseType,
            zoomOutOnHover: settingsModel.zoomOutOnHover));
  }
}
