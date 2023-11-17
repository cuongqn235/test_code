import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:joke_app/domain/entities/add_joke_feedback_input.dart';
import 'package:joke_app/domain/entities/joke_entity.dart';
import 'package:joke_app/domain/usecases/joke/add_joke_feedback_usecase.dart';
import 'package:joke_app/domain/usecases/joke/get_joke_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetJokeUseCase _getJokeUseCase;
  final AddJokeFeedbackUseCase _addJokeFeedbackUseCase;
  HomeBloc(this._getJokeUseCase, this._addJokeFeedbackUseCase)
      : super(HomeInitial()) {
    on<HomeEventOnStart>(_onStart);
    on<HomeEventOnNextJoke>(_onNextJoke);
  }

  FutureOr<void> _onStart(
      HomeEventOnStart event, Emitter<HomeState> emit) async {
    try {
      final res = await _getJokeUseCase.execute();
      final data = res.fold((l) => throw l, (r) => r);
      if (data != null) {
        emit(HomeStateJoke(joke: data));
        return;
      }
      emit(HomeStateNotFound());
    } catch (e) {
      emit(HomeStateError());
    }
  }

  FutureOr<void> _onNextJoke(
      HomeEventOnNextJoke event, Emitter<HomeState> emit) async {
    try {
      final res = await _addJokeFeedbackUseCase.execute(
        AddJokeFeedbackInput(
          event.id,
          event.isFunny,
        ),
      );
      if (res.isRight()) {
        add(HomeEventOnStart());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(HomeStateError());
    }
  }
}
