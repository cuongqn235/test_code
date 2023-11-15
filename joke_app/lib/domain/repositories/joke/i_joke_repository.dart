import 'package:joke_app/domain/entities/joke_entity.dart';

abstract class IJokeRepository {
  Future<void> setupData();
  Future<JokeEntity?> getJokeModelDontFunny();
}
