import 'package:flutter/material.dart';

import 'avaz_button.dart';

class PictureButton extends StatelessWidget {
  const PictureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvazButton(
      height: 100,
      width: 100,
      child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green.shade300,
            borderRadius: BorderRadius.circular(8)),
        child: const Text(
          'P',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
