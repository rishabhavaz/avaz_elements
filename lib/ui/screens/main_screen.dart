import 'dart:developer';

import 'package:avaz_elements/ui/screens/gridview.dart';
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 4,
      key: const Key('hello'),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.visitChildElements((element) {
                              log('ELEMENT: ${element.widget.key} ');
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AvazButton(
                                  width: width * .4,
                                  height: 100,
                                  label: '',
                                  child: BlocBuilder<ButtonActionCubit,
                                      ButtonActionState>(
                                    builder: (context, state) {
                                      return Text(
                                        state.text,
                                        style: const TextStyle(fontSize: 20),
                                      );
                                    },
                                  ),
                                ),
                                AvazButton(
                                  width: height * .14,
                                  height: height * .14,
                                  label: '#',
                                  child: const Text(
                                    '#',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 3,
                        child: GridWidget(),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.transparent),
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
          // const Expanded(child: SettingsWidget())
        ],
      ),
    );
  }
}
