import 'package:avaz_elements/widgets/avaz_button.dart';
import 'package:avaz_elements/widgets/keyboard_button.dart';
import 'package:flutter/material.dart';

import '../widgets/menu_button.dart';
import '../widgets/picture_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Positioned(left: 100, top: 100, child: KeyboardButton()),
          Positioned(bottom: 100, left: 300, child: MenuButton()),
          Positioned(right: 100, top: 150, child: PictureButton()),
        ],
      ),
    );
  }
}
