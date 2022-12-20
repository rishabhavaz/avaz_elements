part of 'hit_test_cubit.dart';

class HitTestState extends Equatable {
  final Map<int, Offset> touchPositions;
  final TouchType touchType;
  const HitTestState({required this.touchPositions, required this.touchType});

  @override
  List<Object> get props => [touchPositions, touchType];
}
