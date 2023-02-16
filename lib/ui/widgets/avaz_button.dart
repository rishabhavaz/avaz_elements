import 'dart:async';
import 'dart:developer';

import 'package:avaz_elements/constants/session_helper.dart';
import 'package:avaz_elements/cubit/button_feedback/button_feedback_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/button_action_cubit.dart';
import '../../cubit/hit_test_cubit.dart';
import '../../enums.dart';

class AvazButton extends StatelessWidget {
  final Widget child;
  final String label;
  final double? height;
  final double? width;
  const AvazButton(
      {super.key,
      required this.child,
      required this.label,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonFeedbackCubit>(
        create: (context) => ButtonFeedbackCubit(),
        child: AvazButtonWidget(
          label: label,
          height: height,
          width: width,
          child: child,
        ));
  }
}

class AvazButtonWidget extends StatefulWidget {
  final Widget child;
  final String label;
  final double? height;
  final double? width;
  const AvazButtonWidget(
      {Key? key,
      required this.child,
      required this.label,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  State<AvazButtonWidget> createState() => _AvazButtonWidgetState();
}

class _AvazButtonWidgetState extends State<AvazButtonWidget> {
  // var key = UniqueKey();
  Offset topLeft = const Offset(-1, -1);
  Offset bottomRight = const Offset(-1, -1);

  _getRect() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Rect rect = renderBox.paintBounds;
    topLeft = renderBox.localToGlobal(rect.topLeft);
    bottomRight = renderBox.localToGlobal(rect.bottomRight);
  }

  bool _isRemovePositionInsideCurrentWidget(Offset removePosition) {
    if (removePosition.dx > topLeft.dx &&
        removePosition.dy > topLeft.dy &&
        removePosition.dx < bottomRight.dx &&
        removePosition.dy < bottomRight.dy) {
      return true;
    }
    return false;
  }

  bool _isHitInsideWidget({required Map<int, Offset> globalPositions}) {
    for (var i = 0; i < globalPositions.length; i++) {
      if (globalPositions.values.elementAt(i).dx > topLeft.dx &&
          globalPositions.values.elementAt(i).dy > topLeft.dy &&
          globalPositions.values.elementAt(i).dx < bottomRight.dx &&
          globalPositions.values.elementAt(i).dy < bottomRight.dy) {
        return true;
      }
    }
    return false;
  }

  _onScroll() {
    // Get the global offset of the widget with respect to the screen.
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    // Get the screen height and width.
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the offsets of the widget with respect to the screen height and width.
    final double offsetY = offset.dy ?? 0.0;
    final double offsetX = offset.dx ?? 0.0;
    final double offsetFromBottom =
        screenHeight - offsetY - renderBox.size.height ?? 0.0;
    final double offsetFromRight =
        screenWidth - offsetX - renderBox.size.width ?? 0.0;

    // Use the offsets as needed.
    topLeft = Offset(offsetX, offsetY);
    bottomRight = Offset(offsetFromRight, offsetFromBottom);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getRect();
    });
    super.initState();
  }

  Timer? timer;
  Color borderColor = Colors.blue;
  Set<Timer> timerSet = <Timer>{};

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocConsumer<HitTestCubit, HitTestState>(
      listener: (context, state) {
        // log("Position ${widget.label}: $topLeft $bottomRight [H/W: $height $width]");
        _onScroll();
        var isHit = _isHitInsideWidget(globalPositions: state.touchPositions);
        if (isHit && state.touchType == TouchType.tapUp) {
          if (_isRemovePositionInsideCurrentWidget(state.removePosition!)) {
            if (timer != null && timer!.tick == 1) {
              BlocProvider.of<ButtonActionCubit>(context)
                  .onTapped(widget.label);
            }
            pointers.clear();
          }
          pointers.remove(state.removeId);
        }
      },
      builder: (context, state) {
        var isHit = _isHitInsideWidget(globalPositions: state.touchPositions);
        if (isHit) {
          if (timer == null) {
            BlocProvider.of<ButtonFeedbackCubit>(context)
                .changeBorderColor(Colors.purpleAccent);
          }
          if (timer != null && timer!.tick == 1) {
            BlocProvider.of<ButtonFeedbackCubit>(context)
                .changeBorderColor(Colors.green);
          }
          timer ??= Timer(const Duration(seconds: 1), () {
            BlocProvider.of<ButtonFeedbackCubit>(context)
                .changeBorderColor(Colors.green);
            timerSet.add(timer!);
          });
        } else {
          BlocProvider.of<ButtonFeedbackCubit>(context)
              .changeBorderColor(Colors.blue);
          if (timer != null) {
            timer!.cancel();
            timer = null;
          }
        }
        return BlocBuilder<ButtonFeedbackCubit, ButtonFeedbackState>(
          builder: (context, feedbackState) {
            return Container(
                height: widget.height ?? height * .2,
                width: widget.width ?? height * .2,
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: isHit ? 5 : 1,
                        color: feedbackState.feedback.borderColor)),
                child: widget.child);
          },
        );
      },
    );
  }
}
