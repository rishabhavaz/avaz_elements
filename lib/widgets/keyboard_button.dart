import 'package:avaz_elements/widgets/avaz_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/button_feedback/button_feedback_bloc.dart';

class KeyboardButton extends StatelessWidget {
  const KeyboardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvazButton(
      height: 100,
      width: 100,
      child: BlocBuilder<ButtonFeedbackBloc, ButtonFeedbackState>(
        builder: (context, state) {
          return Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: state.buttonFeedbackModel.backgroundColor,
                borderRadius: BorderRadius.circular(8)),
            child: const Text(
              'K',
              style: TextStyle(fontSize: 40),
            ),
          );
        },
      ),
    );
  }
}
