import 'package:avaz_elements/settings/model/settings_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsModel settingsModel = SettingsModel();
  SettingsBloc() : super(SettingsState(settingsModel: SettingsModel())) {
    // on<UpdateSettings>((event, emit) {
    //   emit(SettingsState(
    //       settingsModel: settingsModel.copyWith(event.settingsModel )));
    // });
  }
}
