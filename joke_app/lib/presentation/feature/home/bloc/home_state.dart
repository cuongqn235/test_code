part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeStateJoke extends HomeState {
  HomeStateJoke({required this.joke});

  @override
  List<Object?> get props => [joke];
  final JokeEntity joke;
}

final class HomeStateNotFound extends HomeState {
  HomeStateNotFound();

  @override
  List<Object?> get props => [];
}

final class HomeStateError extends HomeState {
  HomeStateError();

  @override
  List<Object?> get props => [];
}
