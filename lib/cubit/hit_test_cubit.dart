import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../enums.dart';

part 'hit_test_state.dart';

class HitTestCubit extends Cubit<HitTestState> {
  HitTestCubit()
      : super(HitTestState(
          touchPositions: const {-1: Offset(-1, -1)},
          touchType: TouchType.cancelled,
          removeId: -1,
          removePosition: const Offset(-1, -1),
          time: DateTime.now(),
          pointer: -1,
        ));

  updatePosition(Map<int, Offset> touchPositions,
      {required TouchType touchType,
      required int removeId,
      required Offset removePosition,
      required int? pointer}) {
    emit(state.copyWith(
        touchPositions: touchPositions,
        touchType: touchType,
        removeId: removeId,
        time: DateTime.now(),
        removePosition: removePosition,
        pointer: pointer));
  }
}
