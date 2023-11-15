import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:joke_app/domain/repositories/app/i_app_repository.dart';
import 'package:joke_app/domain/repositories/joke/i_joke_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this._appRepository,
    this._jokeRepository,
  ) : super(AppInitial()) {
    on<AppEventInitial>(_initial);
    on<AppEventEndOnboard>(_endOnBoard);
  }
  final IAppRepository _appRepository;
  final IJokeRepository _jokeRepository;
  FutureOr<void> _initial(AppEventInitial event, Emitter<AppState> emit) async {
    await Future.delayed(const Duration(seconds: 1));

    final isFirstLaunch = _appRepository.isFirstLaunch;

    if (isFirstLaunch) {
      await _appRepository.clearAllData();
      await _jokeRepository.setupData();
    }
    emit(AppInitial(isFirstLaunch: isFirstLaunch));
  }

  FutureOr<void> _endOnBoard(
      AppEventEndOnboard event, Emitter<AppState> emit) async {
    await _appRepository.saveFirstLaunch();
    emit(AppInitial(isFirstLaunch: false));
  }
}
