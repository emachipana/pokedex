class Pokemon {
  String name;
  String mainImg;
  String secondaryImg;
  int? order;
  List<dynamic> types;

  Pokemon({
    required this.name,
    required this.mainImg,
    required this.secondaryImg,
    required this.types,
    required this.order,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json["name"],
      mainImg: json["sprites"]["other"]["official-artwork"]["front_default"],
      secondaryImg: json["sprites"]["other"]["official-artwork"]["front_shiny"],
      types: json["types"],
      order: json["order"]
    );
  }
}
