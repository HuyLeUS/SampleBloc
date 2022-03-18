import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample_bloc/data/model/meme_model.dart';
import 'package:sample_bloc/data/repository/meme_repository.dart';
part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  final MemeRepository _repository = MemeRepository();
  SecondBloc() : super(SecondState.initial()) {
    on<LoadMemeListEvent>(_onLoadMemeEvent);
    on<RefreshMemeListEvent>(_refreshMemeListEvent);
  }

  FutureOr<void> _onLoadMemeEvent(
      LoadMemeListEvent event, Emitter<SecondState> emit) async {
    emit(state.copyWith(isLoading: true));
    final data = await _repository.getMeme();
    if (data.isNotEmpty) {
      data.sort((a, b) => a.width.compareTo(b.width));
    }
    emit(state.copyWith(listMeme: data, isLoading: data.isEmpty));
  }

  FutureOr<void> _refreshMemeListEvent(
      RefreshMemeListEvent event, Emitter<SecondState> emit) async {
    final data = await _repository.getMeme();
    if (data.isNotEmpty) {
      data.sort((a, b) => a.width.compareTo(b.width));
    }
    emit(state.copyWith(listMeme: data, isLoading: data.isEmpty));
  }
}
