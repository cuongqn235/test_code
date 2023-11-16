import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/app/inject_dependency/inject_dependency.dart';
import 'package:joke_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:joke_app/presentation/feature/home/ui/widgets/joke_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    homeBloc = getIt<HomeBloc>()..add(HomeEventOnStart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  switch (state) {
                    case HomeStateJoke():
                      return Expanded(child: JokeBody(joke: state.joke));
                    case HomeStateNotFound():
                      return const Text('Not Found');
                    case HomeStateError():
                      return const Text('Error');
                    default:
                      return const Text('Loading');
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  height: 1,
                  thickness: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                    'This appis created as part of Hisolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this size.'),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Copyright 2021 HLS')
            ],
          ),
        ),
      ),
    );
  }
}
