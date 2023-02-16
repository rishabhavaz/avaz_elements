import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/picture_button.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    log('Scrolling');
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: 15,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20.0,
        childAspectRatio: 2.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) => PictureButton(
        label: index.toString(),
      ),
    );
  }
}
