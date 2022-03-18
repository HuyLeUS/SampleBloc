part of 'second_bloc.dart';

@immutable
abstract class SecondEvent extends Equatable {
  const SecondEvent();

  @override
  List<Object> get props => [];
}

class LoadMemeListEvent extends SecondEvent {
  @override
  List<Object> get props => [];
}

class RefreshMemeListEvent extends SecondEvent {
  @override
  List<Object> get props => [];
}
