import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../constants/session_helper.dart';

part 'button_action_state.dart';

class ButtonActionCubit extends Cubit<ButtonActionState> {
  ButtonActionCubit() : super(ButtonActionState(text: ''));

  void onTapped(String text) {
    emit(ButtonActionState(text: text));
  }
}
