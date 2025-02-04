import 'package:flutter/material.dart';
import 'package:pokedex/core/styles/main.dart';

class PokemonCol extends StatelessWidget {
  final String name;
  final String stat;

  const PokemonCol({
    super.key,
    required this.name,
    required this.stat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: AppStyles.subtitle,
        ),
        Text(
          stat,
          style: AppStyles.normaltext,
        ),
      ],
    );
  }
}
