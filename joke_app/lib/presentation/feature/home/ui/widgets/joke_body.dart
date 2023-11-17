import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/domain/entities/joke_entity.dart';
import 'package:joke_app/presentation/feature/home/bloc/home_bloc.dart';

class JokeBody extends StatelessWidget {
  const JokeBody({super.key, required this.joke});
  final JokeEntity joke;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Center(
              child: Text(
                joke.descriptionJoke,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        IntrinsicHeight(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 40),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                          HomeEventOnNextJoke(
                            joke.id,
                            true,
                          ),
                        );
                  },
                  color: const Color(0xff2C7EDB),
                  textColor: Colors.white,
                  child: const Text('this is Funny!'),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                          HomeEventOnNextJoke(
                            joke.id,
                            false,
                          ),
                        );
                  },
                  color: const Color(0xff28B263),
                  textColor: Colors.white,
                  child: const Text('this is not Funny.'),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
