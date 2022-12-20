import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../enums.dart';

part 'hit_test_state.dart';

class HitTestCubit extends Cubit<HitTestState> {
  HitTestCubit()
      : super(const HitTestState(
            touchPositions: {-1: Offset(-1, -1)},
            touchType: TouchType.cancelled));

  updatePosition(Map<int, Offset> touchPositions,
      {required TouchType touchType}) {
    emit(HitTestState(touchPositions: touchPositions, touchType: touchType));
  }

  
}
