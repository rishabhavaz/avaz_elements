part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class UpdateSettings extends SettingsEvent {
  final SettingsModel settingsModel;

  const UpdateSettings({required this.settingsModel});

  @override
  List<Object> get props => [settingsModel];
}
