import 'package:flutter/material.dart';
import 'package:pokedex/core/components/pokemon_badge.dart';
import 'package:pokedex/core/helpers/helpers.dart';
import 'package:pokedex/core/models/pokemon.dart';
import 'package:pokedex/core/styles/colors.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String mainPokemonType = pokemon.types[0]["type"]["name"];

    return InkWell(
      onTap: () => redirectToDetail(context),
      child: Container(
        width: 200,
        height: 160,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.pokemonColors[mainPokemonType] ??
              AppColors.pokemonColors["normal"],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  Helpers.capitalize(pokemon.name),
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "#${pokemon.order}",
                  style: TextStyle(
                    color: AppColors.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.types.map((type) {
                    return PokemonBadge(
                      content: type["type"]["name"],
                    );
                  }).toList(),
                ),
                Image.network(pokemon.mainImg, height: 100)
              ],
            )
          ],
        ),
      ),
    );
  }

  void redirectToDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      "detail",
      arguments: pokemon
    );
  }
}
