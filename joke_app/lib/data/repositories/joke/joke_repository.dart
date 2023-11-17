import 'package:injectable/injectable.dart';
import 'package:joke_app/data/providers/local/joke/joke_dao.dart';
import 'package:joke_app/data/providers/local/joke/joke_model.dart';
import 'package:joke_app/domain/entities/add_joke_feedback_input.dart';
import 'package:joke_app/domain/entities/joke_entity.dart';
import 'package:joke_app/domain/repositories/joke/i_joke_repository.dart';

@LazySingleton(as: IJokeRepository)
class JokeRepository implements IJokeRepository {
  final JokeDao _jokeDao;
  JokeRepository(this._jokeDao);
  @override
  Future<void> setupData() {
    final jokeEntities = JokeEntity.fakeData;
    final jokeModels = jokeEntities.map((e) {
      int? isFunny;
      if (e.isFunny != null) {
        isFunny = e.isFunny! ? 1 : 0;
      }
      return JokeModel(
        id: e.id,
        isFunny: isFunny,
        descriptionJoke: e.descriptionJoke,
        createdAt: e.createdAt,
      );
    }).toList();
    return _jokeDao.saveAll(jokeModels);
  }

  @override
  Future<JokeEntity?> getJokeModelDontFunny() async {
    final model = await _jokeDao.getJokeModelDontFunny();
    if (model != null) {
      return JokeEntity.fromModel(model);
    }
    return null;
  }

  @override
  Future<void> addJokeFeedback(AddJokeFeedbackInput input) async {
    final model = await _jokeDao.findById(input.jokeId);
    if (model != null) {
      await _jokeDao.updateData(
        JokeModel(
          id: model.id,
          isFunny: input.isFunny ? 1 : 0,
          descriptionJoke: model.descriptionJoke,
          createdAt: model.createdAt,
        ),
      );
    }
  }
}
