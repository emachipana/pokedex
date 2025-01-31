class PokemonBase {
  PokemonBase({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonBase.fromJson(Map<String, dynamic> json) {
    return PokemonBase(
      name: json["name"],
      url: json["url"]
    );
  }
}
