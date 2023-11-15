import 'package:flutter/material.dart';
import 'package:joke_app/app/inject_dependency/inject_dependency.dart';
import 'package:joke_app/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    configureDependencies(),
  ]);

  runApp(const App());
}
