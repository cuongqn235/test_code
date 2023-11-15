import 'package:joke_app/data/providers/local/joke/joke_model.dart';

class JokeEntity {
  JokeEntity({
    required this.id,
    required this.isFunny,
    required this.descriptionJoke,
    required this.createdAt,
  });
  final String id;
  final bool? isFunny;
  final String descriptionJoke;
  final String createdAt;
  factory JokeEntity.fromModel(JokeModel model) {
    return JokeEntity(
      id: model.id,
      isFunny: model.isFunny,
      descriptionJoke: model.descriptionJoke,
      createdAt: model.createdAt,
    );
  }
  JokeModel get toModel => JokeModel(
        id: id,
        isFunny: isFunny,
        descriptionJoke: descriptionJoke,
        createdAt: createdAt,
      );

  static List<JokeEntity> get fakeData => [
        JokeEntity(
          id: '1',
          isFunny: null,
          descriptionJoke:
              'Why dont scientists trust atoms? Because they make up everything!',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '2',
          isFunny: null,
          descriptionJoke:
              'I told my computer I needed a break, and now it won\'t stop sending me vacation ads. Apparently, I\'ve created a "restless browser"!',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '3',
          isFunny: null,
          descriptionJoke:
              'Why did the math book look sad? Because it had too many problems.',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '4',
          isFunny: null,
          descriptionJoke:
              'I used to play piano by ear, but now I use my hands and fingers.',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '5',
          isFunny: null,
          descriptionJoke:
              'Why did the scarecrow win an award? Because he was outstanding in his field!',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '6',
          isFunny: null,
          descriptionJoke:
              'I\'m reading a book on anti-gravity. It\'s impossible to put down.',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '7',
          isFunny: null,
          descriptionJoke:
              'What do you call a fish wearing a crown? A kingfish!',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '8',
          isFunny: null,
          descriptionJoke:
              'I told my wife she was drawing her eyebrows too high. She looked surprised.',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '9',
          isFunny: null,
          descriptionJoke:
              'Why don\'t skeletons fight each other? They don\'t have the guts.',
          createdAt: DateTime.now().toString(),
        ),
        JokeEntity(
          id: '10',
          isFunny: null,
          descriptionJoke:
              'Why did the bicycle fall over? Because it was two-tired!',
          createdAt: DateTime.now().toString(),
        ),
      ];
}
