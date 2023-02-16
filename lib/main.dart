import 'dart:developer';

import 'package:avaz_elements/ui/screens/multi_touch_page.dart';
import 'package:avaz_elements/ui/screens/touch_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_indicator/touch_indicator.dart';

import 'cubit/button_action_cubit.dart';
import 'cubit/hit_test_cubit.dart';
import 'settings/settings_bloc.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/multi_gesture_detector.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HitTestCubit>(
          create: (context) => HitTestCubit(),
        ),
        BlocProvider<ButtonActionCubit>(
            create: (context) => ButtonActionCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
