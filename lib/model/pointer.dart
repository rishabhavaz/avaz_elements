import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PointerModel extends Equatable {
  final int id;
  final Offset offset;
  final DateTime? tapDownTime;
  final DateTime? tapUpTime;

  const PointerModel(
      {required this.id,
      required this.offset,
      this.tapDownTime,
      this.tapUpTime});

  PointerModel copyWith(
      {int? id, Offset? offset, DateTime? tapDownTime, DateTime? tapUpTime}) {
    return PointerModel(
        id: id ?? this.id,
        offset: offset ?? this.offset,
        tapDownTime: tapDownTime ?? this.tapDownTime,
        tapUpTime: tapUpTime ?? this.tapDownTime);
  }

  static PointerModel defaultModel() {
    return PointerModel(
        id: -1,
        offset: const Offset(-1, -1),
        tapDownTime: DateTime.now(),
        tapUpTime: DateTime.now());
  }

  @override
  List<Object?> get props => [id, offset, tapDownTime, tapUpTime];
}
