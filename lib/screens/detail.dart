import 'package:flutter/material.dart';
import 'package:pokedex/core/components/pokemon_badge.dart';
import 'package:pokedex/core/components/pokemon_col.dart';
import 'package:pokedex/core/helpers/helpers.dart';
import 'package:pokedex/core/models/pokemon.dart';
import 'package:pokedex/core/styles/colors.dart';
import 'package:pokedex/core/styles/main.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;
  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String mainType = pokemon.types[0]["type"]["name"];
    Color? bgColor =
        AppColors.pokemonColors[mainType] ?? AppColors.pokemonColors["normal"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Helpers.capitalize(pokemon.name),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: bgColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: pokemon.types.map((type) {
                    return PokemonBadge(content: type["type"]["name"]);
                  }).toList(),
                ),
                Text(
                  "#${pokemon.order}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                  ),
                )
              ],
            ),
            Image.network(
              pokemon.mainImg,
              height: 260,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokemonCol(
                          name: "Altura",
                          stat: "${pokemon.height / 10}0 m",
                        ),
                        PokemonCol(
                          name: "Peso",
                          stat: "${pokemon.weight / 10}0 kg",
                        ),
                        PokemonCol(
                          name: "Experiencia base",
                          stat: "${pokemon.experience} XP",
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: pokemon.stats.map((stat) {
                      int baseStat = stat["base_stat"];          

                      return Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Helpers.parseStat(stat["stat"]["name"]),
                              style: AppStyles.subtitle,
                            ),
                            Row(
                              children: [
                                Text(
                                  baseStat.toString(),
                                  style: AppStyles.normaltext,
                                ),
                                SizedBox(width: 10),
                                Stack(
                                  children: [
                                    Container(
                                      width: 190,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[350],
                                        borderRadius:
                                            BorderRadius.circular(6),
                                      ),
                                    ),
                                    Container(
                                      width: baseStat > 100 ? 190 : 190 * (baseStat / 100),
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius:
                                            BorderRadius.circular(6),
                                    ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
