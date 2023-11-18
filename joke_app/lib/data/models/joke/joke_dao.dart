import 'package:injectable/injectable.dart';
import 'package:joke_app/data/models/joke/joke_model.dart';
import 'package:joke_app/data/providers/local/dao/base_dao.dart';

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

  Future<int> updateData(JokeModel data) async {
    final result = await sqlite.rawUpdate(
      'UPDATE $tableName SET isFunny = ? WHERE id = ?',
      [data.isFunny, data.id],
    );
    return result;
  }
}
