import '../../enums.dart';

enum SettingKeys {
  loaderEnabled,
  showBorderFeedbankOnHover,
  showFeedbackOnHover,
  zoomOutOnHover,
  touchReleaseType,
  enableScanning,
}

class SettingsModel {
  final bool loaderEnabled;
  final bool showFeedbackOnHover;
  final bool showBorderFeedbankOnHover;
  final bool zoomOutOnHover;
  final TouchReleaseType touchReleaseType;
  final bool enableScanning;

  SettingsModel(
      {this.loaderEnabled = false,
      this.showFeedbackOnHover = false,
      this.showBorderFeedbankOnHover = false,
      this.zoomOutOnHover = false,
      this.touchReleaseType = TouchReleaseType.onTapUp,
      this.enableScanning = false});

  SettingsModel copyWith(
      {bool? loaderEnabled,
      bool? showFeedbackOnHover,
      bool? showBorderFeedbankOnHover,
      bool? zoomOutOnHover,
      TouchReleaseType? touchReleaseType,
      bool? enableScanning}) {
    return SettingsModel(
        loaderEnabled: loaderEnabled ?? this.loaderEnabled,
        showBorderFeedbankOnHover:
            showBorderFeedbankOnHover ?? this.showBorderFeedbankOnHover,
        showFeedbackOnHover:
            showFeedbackOnHover ?? this.showBorderFeedbankOnHover,
        touchReleaseType: touchReleaseType ?? this.touchReleaseType,
        zoomOutOnHover: zoomOutOnHover ?? this.zoomOutOnHover,
        enableScanning: enableScanning ?? this.enableScanning);
  }
}
