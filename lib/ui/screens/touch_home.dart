import 'package:avaz_elements/ui/widgets/picture_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/button_action_cubit.dart';
import '../widgets/avaz_button.dart';

class TouchHome extends StatelessWidget {
  const TouchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<ButtonActionCubit, ButtonActionState>(
            builder: (context, state) {
              return Container(
                height: 150,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '${state.text} ${state.text != '' ? 'Pressed' : ''}',
                  style: const TextStyle(fontSize: 20),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox.shrink(),
              PictureButton(label: 'A'),
              PictureButton(label: 'B'),
              PictureButton(label: 'C'),
              SizedBox.shrink(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox.shrink(),
              PictureButton(label: 'D'),
              PictureButton(label: 'E'),
              PictureButton(label: 'F'),
              SizedBox.shrink(),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
