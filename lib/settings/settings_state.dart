part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final SettingsModel settingsModel;
  const SettingsState({required this.settingsModel});

  @override
  List<Object> get props => [settingsModel];
}
