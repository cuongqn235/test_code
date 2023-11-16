import 'package:flutter/material.dart';
import 'package:joke_app/domain/entities/joke_entity.dart';

class JokeBody extends StatelessWidget {
  const JokeBody({super.key, required this.joke});
  final JokeEntity joke;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        Expanded(child: Center(child: Text(joke.descriptionJoke))),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 40),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                color: Color(0xff2C7EDB),
                child: const Text('this is Funny!'),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                color: Color(0xff2C7EDB),
                child: const Text('this is not Funny.'),
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
