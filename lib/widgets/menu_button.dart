import 'package:avaz_elements/widgets/avaz_button.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

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
            color: Colors.pink.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: const Text(
          'M',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
