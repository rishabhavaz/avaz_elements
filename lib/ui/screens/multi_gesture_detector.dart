import 'dart:developer';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultiGestureDetector extends StatelessWidget {
  MultiGestureDetector({Key? key}) : super(key: key);

  final ImmediateMultiDragGestureRecognizer _recognizer =
      ImmediateMultiDragGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (event) {},
        child: RawGestureDetector(
          gestures: <Type, GestureRecognizerFactory>{
            CustomMultiTouchRecognizer: GestureRecognizerFactoryWithHandlers<
                    CustomMultiTouchRecognizer>(
                () => CustomMultiTouchRecognizer(debugOwner: null),
                (CustomMultiTouchRecognizer instance) {
              instance.onStart = (Offset position) {
                return CustomDrag(events: instance.events);
              };
            })
          },
        ),
      ),
    );
  }
}

class CustomDrag extends Drag {
  final List<PointerDownEvent> events;
  CustomDrag({required this.events});
  @override
  void update(DragUpdateDetails details) {
    log('${events.length}');
    super.update(details);
  }

  @override
  void end(DragEndDetails details) {
    super.end(details);
  }
}

class CustomMultiTouchRecognizer extends MultiDragGestureRecognizer {
  final List<PointerDownEvent> events = [];
  CustomMultiTouchRecognizer({required super.debugOwner});

  @override
  MultiDragPointerState createNewPointerState(PointerDownEvent event) {
    events.add(event);
    return CustomMultiDragPointerState(
        event.position, event.kind, gestureSettings);
  }

  @override
  String get debugDescription => throw UnimplementedError();
}

class CustomMultiDragPointerState extends MultiDragPointerState {
  CustomMultiDragPointerState(
      super.initialPosition, super.kind, super.gestureSettings);

  @override
  void accepted(GestureMultiDragStartCallback starter) {
    starter(initialPosition);
  }
}
