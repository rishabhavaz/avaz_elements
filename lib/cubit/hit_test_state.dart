part of 'hit_test_cubit.dart';

class HitTestState extends Equatable {
  final Map<int, Offset> touchPositions;
  final TouchType touchType;
  final DateTime time;
  final int? removeId;
  final Offset? removePosition;
  const HitTestState({
    required this.touchPositions,
    required this.touchType,
    required this.time,
    required this.removeId,
    required this.removePosition,
  });

  @override
  List<Object> get props => [
        touchPositions,
        touchType,
        time,
      ];
}
