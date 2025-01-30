import 'package:flutter/material.dart';
import 'package:pokedex/presentation/home.dart';
import 'package:pokedex/presentation/loading.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    "loading": (_) => LoadingScreen(),
    "home": (_) => HomeScreen()
  };
}
