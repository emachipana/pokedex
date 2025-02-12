import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      routes: appRoutes,
      onGenerateRoute: onGenerateRoute,
      initialRoute: "loading",
    );
  }
}
