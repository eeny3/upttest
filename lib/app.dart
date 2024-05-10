import 'package:flutter/material.dart';
import 'package:upt_test/routing/app_router.dart';

class App extends StatelessWidget {
  final _router = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'upt',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff2F80ED),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 28,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xff4D2D75),
      ),
      themeMode: ThemeMode.light,
      routerConfig: _router.config(),
    );
  }
}
