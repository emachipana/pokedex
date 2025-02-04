import 'package:flutter/material.dart';
import 'package:pokedex/core/helpers/helpers.dart';
import 'package:pokedex/core/styles/colors.dart';

class PokemonBadge extends StatelessWidget {
  final String content;
  const PokemonBadge({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 5),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
          color: AppColors.white.withAlpha(80),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          Helpers.capitalize(content),
          style: TextStyle(
            fontSize: 12,
            color: AppColors.white,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
