import 'package:joke_app/domain/entities/add_joke_feedback_input.dart';
import 'package:joke_app/domain/entities/joke_entity.dart';

abstract class IJokeRepository {
  Future<void> setupData();
  Future<JokeEntity?> getJokeModelDontFunny();
  Future<void> addJokeFeedback(AddJokeFeedbackInput input);
}
