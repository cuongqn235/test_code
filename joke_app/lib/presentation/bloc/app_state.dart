part of 'app_bloc.dart';

sealed class AppState extends Equatable {}

final class AppInitial extends AppState {
  final bool? isFirstLaunch;

  AppInitial({this.isFirstLaunch});

  @override
  List<Object?> get props => [isFirstLaunch];
}
