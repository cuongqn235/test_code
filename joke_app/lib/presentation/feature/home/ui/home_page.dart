import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/app/gen/assets.gen.dart';
import 'package:joke_app/app/inject_dependency/inject_dependency.dart';
import 'package:joke_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:joke_app/presentation/feature/home/ui/widgets/banner_widget.dart';
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
        appBar: _appBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: BannerWidget()),
              Expanded(
                flex: 3,
                child: Center(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      switch (state) {
                        case HomeStateJoke():
                          return JokeBody(joke: state.joke);
                        case HomeStateNotFound():
                          return Text(
                            'That\'s all the jokes for today! Come back another day!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        case HomeStateError():
                          return const Text('Error');
                        default:
                          return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  height: 1,
                  thickness: 1,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'This appis created as part of Hisolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this size.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 103, 101, 101),
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'Copyright 2021 HLS',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color.fromARGB(255, 72, 71, 71),
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      actions: [
        IntrinsicHeight(
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Handicrafted by'),
                  Text('Jim HLS'),
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CachedNetworkImage(
                    imageUrl: 'https://cdn.eso.org/images/large/eso1031b.jpg',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
        )
      ],
      leading: Assets.icons.icLogo.image(
        width: 40,
        height: 40,
      ),
    );
  }
}
