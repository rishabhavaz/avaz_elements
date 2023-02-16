import 'package:avaz_elements/ui/widgets/avaz_button.dart';
import 'package:flutter/material.dart';

class PictureButton extends StatelessWidget {
  final String label;
  const PictureButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return AvazButton(
      label: label,
      height: height * .15,
      width: height * .15,
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }
}
