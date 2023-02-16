import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ButtonFeedback extends Equatable {
  final Color borderColor;

  const ButtonFeedback({this.borderColor = Colors.blue});

  @override
  List<Object?> get props => [borderColor];
}
