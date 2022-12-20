import 'dart:developer';

import 'package:avaz_elements/ui/screens/scanning_home.dart';
import 'package:avaz_elements/ui/screens/touch_home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/button_action_cubit.dart';
import '../../cubit/hit_test_cubit.dart';
import '../../settings.dart';
import '../../enums.dart';
import '../widgets/avaz_button.dart';
import '../widgets/picture_button.dart';
import 'multi_gesture_detector.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final key = GlobalKey();

  //long tap,
  //double tap,
  //1. Dialog box appears,
  //2. Swipe or scrolling,
  //3. Long taps, double taps.
  //4.

  @override
  void initState() {
    super.initState();
  }

  Map<int, Offset> touchPositions = <int, Offset>{};

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        touchPositions[event.pointer] = event.position;
        BlocProvider.of<HitTestCubit>(context)
            .updatePosition(touchPositions, touchType: TouchType.tapDown);
      },
      onPointerMove: (event) {
        touchPositions[event.pointer] = event.position;
        log(' touchPositions: ${touchPositions}');
        BlocProvider.of<HitTestCubit>(context)
            .updatePosition(touchPositions, touchType: TouchType.moving);
      },
      onPointerUp: (event) {
        touchPositions.remove(event.pointer);
        BlocProvider.of<HitTestCubit>(context)
            .updatePosition(touchPositions, touchType: TouchType.tapUp);
      },
      onPointerCancel: (event) {
        touchPositions.remove(event.pointer);
        BlocProvider.of<HitTestCubit>(context).updatePosition(
            {-1: const Offset(-1, -1)},
            touchType: TouchType.cancelled);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TouchHome(),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
