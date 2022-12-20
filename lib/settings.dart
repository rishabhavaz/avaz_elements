import 'package:flutter/material.dart';

import 'ui/widgets/check_box_tile.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CheckBoxTile(title: 'Enable Loader'),
        CheckBoxTile(title: 'Show Feedback on Hover'),
        CheckBoxTile(title: 'Show Border feedback'),
        CheckBoxTile(title: 'Touch Release Type'),
        CheckBoxTile(title: 'Zoom Out On Hover'),
        CheckBoxTile(title: 'Scan Mode')
      ],
    );
  }
}
