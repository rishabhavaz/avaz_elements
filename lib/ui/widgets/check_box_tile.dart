import 'package:flutter/material.dart';

class CheckBoxTile extends StatelessWidget {
  final String title;
  const CheckBoxTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title),
      Checkbox(
        onChanged: (val) {},
        value: true,
      )
    ]);
  }
}
