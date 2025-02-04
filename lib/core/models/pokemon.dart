class Pokemon {
  int id;
  String name;
  String mainImg;
  int order;
  int height;
  int weight;
  int experience;
  List<dynamic> types;
  List<dynamic> stats;

  Pokemon({
    required this.name,
    required this.mainImg,
    required this.types,
    required this.order,
    required this.id,
    required this.height,
    required this.weight,
    required this.experience,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json["name"],
      mainImg: json["sprites"]["other"]["official-artwork"]["front_default"],
      types: json["types"],
      order: json["order"],
      id: json["id"],
      height: json["height"],
      weight: json["weight"],
      experience: json["base_experience"],
      stats: json["stats"],
    );
  }
}
