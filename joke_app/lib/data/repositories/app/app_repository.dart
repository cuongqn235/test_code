import 'package:injectable/injectable.dart';
import 'package:joke_app/data/providers/local/app/i_app_local_datasource.dart';
import 'package:joke_app/data/providers/local/joke/joke_dao.dart';
import 'package:joke_app/domain/repositories/app/i_app_repository.dart';

@LazySingleton(as: IAppRepository)
class AppRepository implements IAppRepository {
  final IAppLocalDatasource _appLocalDatasource;
  final JokeDao _jokeDao;
  AppRepository(this._appLocalDatasource, this._jokeDao);
  @override
  bool get isFirstLaunch => _appLocalDatasource.isFirstLaunch;

  @override
  Future<void> saveFirstLaunch() {
    return _appLocalDatasource.saveFirstLaunch();
  }

  @override
  Future<void> clearAllData() async {
    await Future.wait([
      _appLocalDatasource.clearAllData(),
      _jokeDao.clear(),
    ]);
  }
}
