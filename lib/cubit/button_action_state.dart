part of 'button_action_cubit.dart';

class ButtonActionState extends Equatable {
  final String text;

  ButtonActionState({required this.text});

  @override
  List<Object?> get props => [text];
}
