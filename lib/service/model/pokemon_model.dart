class PokemonModel {
  final String? species, eggGroup, eggCycle, name;
  final int? height, weight;
  final int id,color;
  final List<String> abilities, types;
  final double maleBreedPercentage, femaleBreedPercentage;
  final int? hp, attack, defense, spAttack, spDef, speed;
  final String? imagePath;
  final List<TypeMatchup> offenseMatchups,defenseMatchups;
  final List<PokemonEvolution> evolutions;

  int totalStats() {
    return (hp ?? 0) +
        (attack ?? 0) +
        (defense ?? 0) +
        (spAttack ?? 0) +
        (spDef ?? 0) +
        (speed ?? 0);
  }

  PokemonModel({
    required this.evolutions,
    required this.imagePath,
    required this.defenseMatchups,
    required this.offenseMatchups,
    required this.species,
    required this.eggGroup,
    required this.eggCycle,
    required this.name,
    required this.height,
    required this.weight,
    required this.id,
    required this.abilities,
    required this.types,
    required this.maleBreedPercentage,
    required this.femaleBreedPercentage,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDef,
    required this.speed,
    required this.color,
  });
}



class TypeMatchup {
  final String type;
  final int damageFactor;

  TypeMatchup({required this.type, required this.damageFactor});

  bool get isWeak => damageFactor > 100;
  bool get isResist => damageFactor < 100 && damageFactor > 0;
  bool get isImmune => damageFactor == 0;
}

class PokemonEvolution{
  final String name;
  final String imagePath;

  PokemonEvolution({required this.name, required this.imagePath});
}