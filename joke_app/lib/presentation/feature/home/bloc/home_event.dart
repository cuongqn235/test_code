part of 'home_bloc.dart';

sealed class HomeEvent {}

class HomeEventOnStart extends HomeEvent {}

class HomeEventOnNextJoke extends HomeEvent {}
