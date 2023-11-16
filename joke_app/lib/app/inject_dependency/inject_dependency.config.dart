// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:sqflite/sqflite.dart' as _i3;

import '../../data/providers/local/app/app_local_datasource.dart' as _i8;
import '../../data/providers/local/app/i_app_local_datasource.dart' as _i7;
import '../../data/providers/local/joke/joke_dao.dart' as _i5;
import '../../data/repositories/app/app_repository.dart' as _i10;
import '../../data/repositories/joke/joke_repository.dart' as _i12;
import '../../domain/repositories/app/i_app_repository.dart' as _i9;
import '../../domain/repositories/joke/i_joke_repository.dart' as _i11;
import '../../domain/usecases/joke/get_joke_usecase.dart' as _i14;
import '../../presentation/bloc/app_bloc.dart' as _i13;
import '../../presentation/feature/home/bloc/home_bloc.dart' as _i15;
import '../../presentation/initial/initial_cubit.dart' as _i4;
import '../modules/local_module.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final localModule = _$LocalModule();
  await gh.factoryAsync<_i3.Database>(
    () => localModule.sqlite,
    preResolve: true,
  );
  gh.factory<_i4.InitialCubit>(() => _i4.InitialCubit());
  gh.singleton<_i5.JokeDao>(_i5.JokeDao(sqlite: gh<_i3.Database>()));
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => localModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i7.IAppLocalDatasource>(
      () => _i8.AppLocalDatasource(gh<_i6.SharedPreferences>()));
  gh.lazySingleton<_i9.IAppRepository>(
      () => _i10.AppRepository(gh<_i7.IAppLocalDatasource>()));
  gh.lazySingleton<_i11.IJokeRepository>(
      () => _i12.JokeRepository(gh<_i5.JokeDao>()));
  gh.factory<_i13.AppBloc>(() => _i13.AppBloc(
        gh<_i9.IAppRepository>(),
        gh<_i11.IJokeRepository>(),
      ));
  gh.factory<_i14.GetJokeUseCase>(
      () => _i14.GetJokeUseCase(gh<_i11.IJokeRepository>()));
  gh.factory<_i15.HomeBloc>(() => _i15.HomeBloc(gh<_i14.GetJokeUseCase>()));
  return getIt;
}

class _$LocalModule extends _i16.LocalModule {}
