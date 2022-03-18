import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'first_bloc_event.dart';
part 'first_bloc_state.dart';

class FirstBloc extends Bloc<FirstBlocEvent, FirstState> {
  FirstBloc() : super(FirstState.initial()) {
    on<ButtonNextClickedEvent>((event, emit) {});
    on<TextNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
  }
}
