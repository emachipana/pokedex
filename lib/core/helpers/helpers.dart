class Helpers {
  static String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String parseStat(String name) {
    Map<String, String> stats = {
      "hp": "HP",
      "attack": "Ataque",
      "defense": "Defensa",
      "special-attack": "Ataque esp.",
      "special-defense": "Defensa esp.",
      "speed": "Velocidad"
    };

    return stats[name] ?? "";
  }
}
