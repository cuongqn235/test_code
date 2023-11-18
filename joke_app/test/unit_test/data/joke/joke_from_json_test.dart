import 'package:flutter_test/flutter_test.dart';
import 'package:joke_app/data/models/joke/joke_model.dart';

void main() {
  group("Test JokeModel initialization from json", () {
    test('Test using json one', () {
      Map<String, dynamic> jokeModelAsJson = {
        'id': 1,
        'isFunny': null,
        'descriptionJoke': '123123123',
        'createdAt': '2021-10-10 10:10:10Z'
      };
      final data = JokeModel.fromJson(jokeModelAsJson);
      expect(data.id, 1);
      expect(data.isFunny, null);
      expect(data.createdAt, '2021-10-10 10:10:10Z');
      expect(data.descriptionJoke, '123123123');
    });
  });
}
