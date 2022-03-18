part of 'first_bloc_bloc.dart';

@immutable
abstract class FirstBlocEvent extends Equatable {}

class ButtonNextClickedEvent extends FirstBlocEvent {
  ButtonNextClickedEvent();
  @override
  List<Object?> get props => [];
}

class TextNameChanged extends FirstBlocEvent {
  final String name;

  TextNameChanged({required this.name});

  @override
  List<Object?> get props => [name];
}
