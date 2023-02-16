part of 'hit_test_cubit.dart';

class HitTestState extends Equatable {
  final Map<int, Offset> touchPositions;
  final TouchType touchType;
  final DateTime time;
  final int? removeId;
  final Offset? removePosition;
  final int? pointer;
  const HitTestState({
    required this.touchPositions,
    required this.touchType,
    required this.time,
    required this.removeId,
    required this.removePosition,
    required this.pointer,
  });

  HitTestState copyWith({
    Map<int, Offset>? touchPositions,
    TouchType? touchType,
    DateTime? time,
    int? removeId,
    Offset? removePosition,
    int? pointer
  }) {
    return HitTestState(
      pointer: pointer ?? this.pointer,
      touchPositions: touchPositions ?? this.touchPositions,
      touchType: touchType ?? this.touchType,
      time: time ?? this.time,
      removeId: removeId ?? this.removeId,
      removePosition: removePosition ?? this.removePosition,
    );
  }

  @override
  List<Object> get props => [
        touchPositions,
        touchType,
        time,
      ];
}
