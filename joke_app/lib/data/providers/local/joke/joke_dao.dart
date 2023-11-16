import 'package:injectable/injectable.dart';
import 'package:joke_app/data/providers/local/dao/base_dao.dart';
import 'package:joke_app/data/providers/local/joke/joke_model.dart';

@singleton
class JokeDao extends AppBaseDaoImpl<JokeModel> {
  JokeDao({
    required super.sqlite,
  }) : super(tableName: JokeModel.table);
  @override
  JokeModel jsonToEntity(Map<String, Object?> json) {
    return JokeModel.fromJson(json);
  }

  Future<JokeModel?> fetchJokeModel(String id) async {
    final result = await sqlite.rawQuery(
      'SELECT * FROM $tableName WHERE id = ?',
      [id],
    );
    final entities = result.map(jsonToEntity).toList();
    if (entities.isEmpty) {
      return null;
    }
    return entities.first;
  }

  Future<JokeModel?> getJokeModelDontFunny() async {
    final result = await sqlite.rawQuery(
      'SELECT * FROM $tableName WHERE isFunny is null',
    );
    final entities = result.map(jsonToEntity).toList();
    if (entities.isEmpty) {
      return null;
    }
    return entities.first;
  }
}
