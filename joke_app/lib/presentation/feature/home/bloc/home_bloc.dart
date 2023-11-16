import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:joke_app/domain/usecases/joke/get_joke_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetJokeUseCase _getJokeUseCase;
  HomeBloc(this._getJokeUseCase) : super(HomeInitial()) {
    on<HomeEventOnStart>(_onStart);
  }

  FutureOr<void> _onStart(
      HomeEventOnStart event, Emitter<HomeState> emit) async {
    try {
      final res = await _getJokeUseCase.execute();
      final data = res.fold((l) => throw l, (r) => r);
    } catch (e) {}
  }
}
