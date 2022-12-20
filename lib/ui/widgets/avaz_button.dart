import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/button_action_cubit.dart';
import '../../cubit/hit_test_cubit.dart';
import '../../enums.dart';

class AvazButton extends StatefulWidget {
  final Widget child;
  final String label;
  final double? height;
  final double? width;
  const AvazButton(
      {Key? key,
      required this.child,
      required this.label,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  State<AvazButton> createState() => _AvazButtonState();
}

class _AvazButtonState extends State<AvazButton> {
  Offset topLeft = const Offset(-1, -1);
  Offset bottomRight = const Offset(-1, -1);
  _getRect() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Rect rect = renderBox.paintBounds;
    topLeft = renderBox.localToGlobal(rect.topLeft);
    bottomRight = renderBox.localToGlobal(rect.bottomRight);
    log('LEFT TOP: $topLeft RIGHT BOTTOM $topLeft');
  }

  bool _isHitInsideWidget({required Map<int, Offset> globalPositions}) {
    if (topLeft.dx < 0) {
      return false;
    }
    for (var globalPosition in globalPositions.values) {
      if (globalPosition.dx > topLeft.dx &&
          globalPosition.dy > topLeft.dy &&
          globalPosition.dx < bottomRight.dx &&
          globalPosition.dy < bottomRight.dy) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getRect();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<HitTestCubit, HitTestState>(
      listener: (context, state) {
        var isHit = _isHitInsideWidget(globalPositions: state.touchPositions);
        // log('topLeft: $topLeft, bottomRight: $bottomRight, positions: ${state.touchPositions.values}');
        if (isHit && state.touchType == TouchType.tapUp) {
          BlocProvider.of<ButtonActionCubit>(context).onTapped(widget.label);
          // any function
        }
        if (state.touchType == TouchType.tapUp) {
          BlocProvider.of<HitTestCubit>(context).updatePosition(
              {-1: const Offset(-1, -1)},
              touchType: TouchType.cancelled);
        }
      },
      builder: (context, state) {
        log('Positions from bloc: ${state.touchPositions}');
        var isHit = _isHitInsideWidget(globalPositions: state.touchPositions);
        return Container(
          height: widget.height ?? height * .2,
          width: widget.width ?? height * .2,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isHit ? Colors.yellow : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1, color: isHit ? Colors.orange : Colors.blue)),
          child: widget.child,
        );
      },
    );
  }
}
