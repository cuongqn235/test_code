// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;
import 'package:sqflite/sqflite.dart' as _i3;

import '../../data/providers/local/app/app_local_datasource.dart' as _i7;
import '../../data/providers/local/app/i_app_local_datasource.dart' as _i6;
import '../../data/providers/local/joke/joke_dao.dart' as _i4;
import '../../data/repositories/app/app_repository.dart' as _i9;
import '../../data/repositories/joke/joke_repository.dart' as _i11;
import '../../domain/repositories/app/i_app_repository.dart' as _i8;
import '../../domain/repositories/joke/i_joke_repository.dart' as _i10;
import '../../presentation/bloc/app_bloc.dart' as _i12;
import '../modules/local_module.dart' as _i13;

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
  gh.singleton<_i4.JokeDao>(_i4.JokeDao(sqlite: gh<_i3.Database>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => localModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.IAppLocalDatasource>(
      () => _i7.AppLocalDatasource(gh<_i5.SharedPreferences>()));
  gh.lazySingleton<_i8.IAppRepository>(() => _i9.AppRepository(
        gh<_i6.IAppLocalDatasource>(),
        gh<_i4.JokeDao>(),
      ));
  gh.lazySingleton<_i10.IJokeRepository>(
      () => _i11.JokeRepository(gh<_i4.JokeDao>()));
  gh.factory<_i12.AppBloc>(() => _i12.AppBloc(
        gh<_i8.IAppRepository>(),
        gh<_i10.IJokeRepository>(),
      ));
  return getIt;
}

class _$LocalModule extends _i13.LocalModule {}
