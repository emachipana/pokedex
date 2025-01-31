import 'package:flutter/material.dart';
import 'package:pokedex/screens/home.dart';
import 'package:pokedex/screens/loading.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    "loading": (_) => LoadingScreen(),
    "home": (_) => HomeScreen()
  };
}
