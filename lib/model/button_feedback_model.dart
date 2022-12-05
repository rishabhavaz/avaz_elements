import 'package:avaz_elements/model/button_feedback_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ButtonFeedbackModel extends Equatable {
  final Color backgroundColor;
  final bool isLoaderEnabled;
  final bool showBorder;
  const ButtonFeedbackModel({
    required this.backgroundColor,
    required this.isLoaderEnabled,
    required this.showBorder,
  });

  static ButtonFeedbackModel defaultModel() {
    return ButtonFeedbackModel(
        backgroundColor: ButtonFeedbackInfo.finalFeedbackColor,
        isLoaderEnabled: false,
        showBorder: false);
  }

  ButtonFeedbackModel copyWith(
      {Color? backgroundColor, bool? isLoaderEnabled, bool? showBorder}) {
    return ButtonFeedbackModel(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        isLoaderEnabled: isLoaderEnabled ?? this.isLoaderEnabled,
        showBorder: showBorder ?? this.showBorder);
  }

  @override
  List<Object?> get props => [
        backgroundColor,
        isLoaderEnabled,
        showBorder,
      ];
}
