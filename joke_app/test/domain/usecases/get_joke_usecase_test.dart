import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:joke_app/data/providers/local/joke/joke_model.dart';
import 'package:joke_app/domain/entities/joke_entity.dart';

void main() {
  var data = () {
    try {
      final respose = JokeModel(id: 1, descriptionJoke: '1', createdAt: '1');
      return right(JokeEntity.fromModel(respose));
    } catch (e) {
      return left(Exception('Error'));
    }
  }();
  setUp(() {});
  test('Response data', () async {
    expect(data.isRight(), true);
  });

  test('Error data', () async {
    expect(data.isLeft(), true);
  });
}
