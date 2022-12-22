import 'dart:developer';

import 'package:avaz_elements/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/model/settings_model.dart';

class CheckBoxTile extends StatelessWidget {
  final String title;
  final SettingKeys settingKey;
  const CheckBoxTile({Key? key, required this.title, required this.settingKey})
      : super(key: key);

  dynamic getValue(SettingsState state, SettingKeys settingKey) {
    switch (settingKey) {
      case (SettingKeys.enableScanning):
        return state.settingsModel.enableScanning;
      case (SettingKeys.loaderEnabled):
        return state.settingsModel.loaderEnabled;
      case (SettingKeys.showBorderFeedbankOnHover):
        return state.settingsModel.showBorderFeedbankOnHover;
      case (SettingKeys.showFeedbackOnHover):
        return state.settingsModel.showFeedbackOnHover;
      case (SettingKeys.zoomOutOnHover):
        return state.settingsModel.zoomOutOnHover;
      case (SettingKeys.touchReleaseType):
        return state.settingsModel.touchReleaseType;
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title),
      BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Checkbox(
              onChanged: (val) {
                BlocProvider.of<SettingsBloc>(context)
                    .add(UpdateSettings(key: settingKey, value: val));
              },
              value: getValue(state, settingKey));
        },
      )
    ]);
  }
}
