import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/button_action_cubit.dart';
import '../../settings.dart';
import '../widgets/avaz_button.dart';
import '../widgets/picture_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AvazButton(
                                width: 400,
                                height: 100,
                                label: '',
                                child: BlocBuilder<ButtonActionCubit,
                                    ButtonActionState>(
                                  builder: (context, state) {
                                    return Text(
                                      state.text,
                                      style: TextStyle(fontSize: 30),
                                    );
                                  },
                                ),
                              ),
                              AvazButton(
                                width: 100,
                                height: 100,
                                label: '#',
                                child: Text(
                                  '#',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 3),
                                borderRadius: BorderRadius.circular(8)),
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .1),
                            child: Wrap(children: const [
                              PictureButton(label: 'A'),
                              PictureButton(label: 'B'),
                              PictureButton(label: 'C'),
                              PictureButton(label: 'D'),
                              PictureButton(label: 'E'),
                              PictureButton(label: 'F'),
                              PictureButton(label: 'G'),
                              PictureButton(label: 'H'),
                              PictureButton(label: 'I'),
                            ]),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: const [
                        PictureButton(label: 'M1'),
                        PictureButton(label: 'M2'),
                        PictureButton(label: 'M3'),
                        PictureButton(label: 'M4'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: SettingsWidget())
        ],
      ),
    );
  }
}
