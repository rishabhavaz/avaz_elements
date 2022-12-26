import 'dart:developer';

import 'package:avaz_elements/constants/session_helper.dart';
import 'package:avaz_elements/ui/screens/main_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        pointers[event.pointer] = event.position;
        BlocProvider.of<HitTestCubit>(context).updatePosition(pointers,
            touchType: TouchType.tapDown,
            removeId: -1,
            removePosition: event.position);
      },
      onPointerMove: (event) {
        pointers[event.pointer] = event.position;
        BlocProvider.of<HitTestCubit>(context).updatePosition(pointers,
            touchType: TouchType.moving,
            removeId: -1,
            removePosition: event.position);
      },
      onPointerUp: (event) {
        BlocProvider.of<HitTestCubit>(context).updatePosition(pointers,
            touchType: TouchType.tapUp,
            removeId: event.pointer,
            removePosition: event.position);
      },
      onPointerCancel: (event) {
        pointers.remove(event.pointer);
        BlocProvider.of<HitTestCubit>(context).updatePosition(
            {-1: const Offset(-1, -1)},
            touchType: TouchType.cancelled,
            removeId: event.pointer,
            removePosition: event.position);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              MainScreen(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
