import 'package:flutter/material.dart';
import 'package:pokedex/core/components/pokemon_card.dart';
import 'package:pokedex/core/models/home_status.dart';
import 'package:pokedex/core/models/pokemon.dart';
import 'package:pokedex/core/models/pokemon_base.dart';
import 'package:pokedex/core/styles/colors.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  List<Pokemon> pokemons = [];
  HomeStatus state = HomeStatus.loading;

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    try {
      final dio = Dio();
      final response =
          await dio.get("https://pokeapi.co/api/v2/pokemon?limit=100");

      List<Future<Pokemon>> requests =
          response.data["results"].map<Future<Pokemon>>((el) async {
        final pokemonBase = PokemonBase.fromJson(el);
        final pokemonDetailResponse = await dio.get(pokemonBase.url);
        return Pokemon.fromJson(pokemonDetailResponse.data);
      }).toList();

      List<Pokemon> temp = await Future.wait(requests);

      setState(() {
        pokemons = temp;
        state = HomeStatus.succes;
      });
    } catch (e) {
      setState(() {
        state = HomeStatus.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Pokedex",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.gray,
            ),
          ),
        ),
        body: stateController(state, context));
  }

  Widget stateController(HomeStatus state, BuildContext context) {
    Map<HomeStatus, Widget> cases = {
      HomeStatus.succes: pokemonsList(context),
      HomeStatus.loading: loading(context),
      HomeStatus.error: error(context)
    };

    return cases[state] ?? loading(context);
  }

  Widget pokemonsList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: double.maxFinite,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: pokemons.map((pokemon) {
                  return PokemonCard(
                    pokemon: Pokemon(
                      id: pokemon.id,
                      name: pokemon.name,
                      mainImg: pokemon.mainImg,
                      types: pokemon.types,
                      order: pokemon.order,
                      secondaryImg: pokemon.secondaryImg
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      )
    );
  }

  Widget loading(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.gray));
  }

  Widget error(BuildContext context) {
    return Center(
      child: Text(
        "Algó salió mal, vuelve a intentarlo en unos minutos",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
