import 'package:avaz_elements/animtion/border_painter.dart';
import 'package:avaz_elements/bloc/button_feedback/button_feedback_bloc.dart';
import 'package:avaz_elements/model/button_feedback_info.dart';
import 'package:avaz_elements/model/button_feedback_model.dart';
import 'package:avaz_elements/model/touch_release_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvazButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  const AvazButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonFeedbackBloc>(
      create: (context) => ButtonFeedbackBloc(),
      child: AvazButtonWidget(
        child: child,
        height: height,
        width: width,
      ),
    );
  }
}

class AvazButtonWidget extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  const AvazButtonWidget({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<AvazButtonWidget> createState() => _AvazButtonWidgetState();
}

class _AvazButtonWidgetState extends State<AvazButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _loaderAnimationController;

  _startLoaderAnimation() {
    if (ButtonFeedbackInfo.isLoaderEnabled) {
      _loaderAnimationController.forward();
    }
  }

  _stopLoaderAnimation() {
    if (ButtonFeedbackInfo.isLoaderEnabled) {
      _loaderAnimationController.reset();
    }
  }

  @override
  void initState() {
    _loaderAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: TouchReleaseInfo.delayTime),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapDown: (details) {
        _startLoaderAnimation();
        BlocProvider.of<ButtonFeedbackBloc>(context).add(OnTouchDown());
      },
      onTapUp: (details) {
        _stopLoaderAnimation();
        BlocProvider.of<ButtonFeedbackBloc>(context).add(OnTouchUp());
      },
      onVerticalDragStart: (details) {},
      onVerticalDragCancel: () {},
      onHorizontalDragCancel: () {},
      onVerticalDragEnd: (details) {},
      onHorizontalDragStart: (details) {},
      onHorizontalDragEnd: (details) {},
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(
          children: [
            widget.child,
            SizedBox(
              height: widget.height,
              width: widget.width,
              child: CustomPaint(
                painter: BorderPainter(
                  animation: _loaderAnimationController,
                  strokeColor: ButtonFeedbackInfo.borderColor,
                  pathType: PathType.rRect,
                  strokeWidth: 5.0,
                  animationDirection: AnimationDirection.clockwise,
                  startingPercentage: 23,
                  radius: const Radius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
