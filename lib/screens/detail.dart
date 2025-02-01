import 'package:flutter/material.dart';
import 'package:pokedex/core/helpers/helpers.dart';
import 'package:pokedex/core/models/pokemon.dart';
import 'package:pokedex/core/styles/colors.dart';

class DetailScreen extends StatefulWidget {
  final Pokemon pokemon;
  const DetailScreen({
    super.key,
    required this.pokemon
  });

  @override
  State<StatefulWidget> createState() {
    return DetailState(pokemon: pokemon);
  }
}

class DetailState extends State<DetailScreen> {
  final Pokemon pokemon;
  DetailState({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String mainType = pokemon.types[0]["type"]["name"];
    Color? bgColor = AppColors.pokemonColors[mainType] ?? AppColors.pokemonColors["normal"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Helpers.capitalize(pokemon.name),
          style: TextStyle(
            color: AppColors.white
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: bgColor,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.network(pokemon.mainImg, width: 300,),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(child: Text(pokemon.order.toString()),),
            )
          ]
        )
      )
    );
  }
}
