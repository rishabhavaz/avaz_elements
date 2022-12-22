part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class UpdateSettings extends SettingsEvent {
  final SettingKeys key;
  final dynamic value;

  const UpdateSettings({required this.key, required this.value});

  @override
  List<Object> get props => [key, value];
}
