import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon.dart';
import 'package:pokedex/screens/detail.dart';
import 'package:pokedex/screens/home.dart';
import 'package:pokedex/screens/loading.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    "loading": (_) => LoadingScreen(),
    "home": (_) => HomeScreen(),
  };
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  if (settings.name == "detail" && settings.arguments is Pokemon) {
    final pokemon = settings.arguments as Pokemon;
    return MaterialPageRoute(
      builder: (_) => DetailScreen(pokemon: pokemon),
    );
  }

  return MaterialPageRoute(builder: (_) => HomeScreen());
}
