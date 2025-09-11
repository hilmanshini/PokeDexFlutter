import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_response.g.dart';

@JsonSerializable(createToJson: false)
class PokeResponse {
  PokeResponse({
    required this.pokemonV2Pokemon,
  });

  @JsonKey(name: 'pokemon_v2_pokemon')
  final List<PokePokemonV2Pokemon>? pokemonV2Pokemon;

  factory PokeResponse.fromJson(Map<String, dynamic> json) => _$PokeResponseFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokePokemonV2Pokemon {
  PokePokemonV2Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.pokemonV2Pokemonsprites,
    required this.pokemonV2Pokemonabilities,
    required this.pokemonV2Pokemonstats,
    required this.pokemonV2Pokemontypes,
    required this.pokemonV2Pokemonspecy,
    required this.pokemonV2Pokemonmoves,
  });

  final int? id;
  final String? name;
  final int? height;
  final int? weight;

  @JsonKey(name: 'pokemon_v2_pokemonsprites')
  final List<PokemonV2Pokemonsprite>? pokemonV2Pokemonsprites;

  @JsonKey(name: 'pokemon_v2_pokemonabilities')
  final List<PokemonV2Pokemonability>? pokemonV2Pokemonabilities;

  @JsonKey(name: 'pokemon_v2_pokemonstats')
  final List<PokemonV2Pokemonstat>? pokemonV2Pokemonstats;

  @JsonKey(name: 'pokemon_v2_pokemontypes')
  final List<PokemonV2Pokemontype>? pokemonV2Pokemontypes;

  @JsonKey(name: 'pokemon_v2_pokemonspecy')
  final PokemonV2PokemonPokemonV2Pokemonspecy? pokemonV2Pokemonspecy;

  @JsonKey(name: 'pokemon_v2_pokemonmoves')
  final List<PokemonV2Pokemonmove>? pokemonV2Pokemonmoves;

  factory PokePokemonV2Pokemon.fromJson(Map<String, dynamic> json) => _$PokePokemonV2PokemonFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Pokemonability {
  PokemonV2Pokemonability({
    required this.pokemonV2Ability,
  });

  @JsonKey(name: 'pokemon_v2_ability')
  final PokemonV2? pokemonV2Ability;

  factory PokemonV2Pokemonability.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonabilityFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2 {
  PokemonV2({
    required this.name,
  });

  final String? name;

  factory PokemonV2.fromJson(Map<String, dynamic> json) => _$PokemonV2FromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Pokemonmove {
  PokemonV2Pokemonmove({
    required this.level,
    required this.moveLearnMethodId,
    required this.pokemonV2Move,
  });

  final int? level;

  @JsonKey(name: 'move_learn_method_id')
  final int? moveLearnMethodId;

  @JsonKey(name: 'pokemon_v2_move')
  final PokemonV2Move? pokemonV2Move;

  factory PokemonV2Pokemonmove.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonmoveFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Move {
  PokemonV2Move({
    required this.name,
    required this.power,
    required this.accuracy,
    required this.pp,
    required this.pokemonV2Type,
  });

  final String? name;
  final int? power;
  final int? accuracy;
  final int? pp;

  @JsonKey(name: 'pokemon_v2_type')
  final PokemonV2? pokemonV2Type;

  factory PokemonV2Move.fromJson(Map<String, dynamic> json) => _$PokemonV2MoveFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2PokemonPokemonV2Pokemonspecy {
  PokemonV2PokemonPokemonV2Pokemonspecy({
    required this.genderRate,
    required this.hatchCounter,
    required this.pokemonV2Pokemonegggroups,
    required this.pokemonV2Pokemonspeciesnames,
    required this.pokemonV2Evolutionchain,
  });

  @JsonKey(name: 'gender_rate')
  final int? genderRate;

  @JsonKey(name: 'hatch_counter')
  final int? hatchCounter;

  @JsonKey(name: 'pokemon_v2_pokemonegggroups')
  final List<PokemonV2Pokemonegggroup>? pokemonV2Pokemonegggroups;

  @JsonKey(name: 'pokemon_v2_pokemonspeciesnames')
  final List<PokemonV2Pokemonspeciesname>? pokemonV2Pokemonspeciesnames;

  @JsonKey(name: 'pokemon_v2_evolutionchain')
  final PokemonV2Evolutionchain? pokemonV2Evolutionchain;

  factory PokemonV2PokemonPokemonV2Pokemonspecy.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonPokemonV2PokemonspecyFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Evolutionchain {
  PokemonV2Evolutionchain({
    required this.pokemonV2Pokemonspecies,
  });

  @JsonKey(name: 'pokemon_v2_pokemonspecies')
  final List<PokemonV2PokemonspecyElement>? pokemonV2Pokemonspecies;

  factory PokemonV2Evolutionchain.fromJson(Map<String, dynamic> json) => _$PokemonV2EvolutionchainFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2PokemonspecyElement {
  PokemonV2PokemonspecyElement({
    required this.id,
    required this.name,
    required this.pokemonV2Pokemons,
  });

  final int? id;
  final String? name;

  @JsonKey(name: 'pokemon_v2_pokemons')
  final List<PokemonV2PokemonspecyPokemonV2Pokemon>? pokemonV2Pokemons;

  factory PokemonV2PokemonspecyElement.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonspecyElementFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2PokemonspecyPokemonV2Pokemon {
  PokemonV2PokemonspecyPokemonV2Pokemon({
    required this.id,
    required this.name,
    required this.pokemonV2Pokemonsprites,
  });

  final int? id;
  final String? name;

  @JsonKey(name: 'pokemon_v2_pokemonsprites')
  final List<PokemonV2Pokemonsprite>? pokemonV2Pokemonsprites;

  factory PokemonV2PokemonspecyPokemonV2Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonspecyPokemonV2PokemonFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Pokemonsprite {
  PokemonV2Pokemonsprite({
    required this.sprites,
  });

  final Sprites? sprites;

  factory PokemonV2Pokemonsprite.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonspriteFromJson(json);

}

@JsonSerializable(createToJson: false)
class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  @JsonKey(name: 'black-white')
  final Sprites? blackWhite;

  factory GenerationV.fromJson(Map<String, dynamic> json) => _$GenerationVFromJson(json);

}

@JsonSerializable(createToJson: false)
class GenerationIv {
  GenerationIv({
    required this.platinum,
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
  });

  final Sprites? platinum;

  @JsonKey(name: 'diamond-pearl')
  final Sprites? diamondPearl;

  @JsonKey(name: 'heartgold-soulsilver')
  final Sprites? heartgoldSoulsilver;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => _$GenerationIvFromJson(json);

}

@JsonSerializable(createToJson: false)
class Versions {
  Versions({
    required this.generationI,
    required this.generationV,
    required this.generationIi,
    required this.generationIv,
    required this.generationVi,
    required this.generationIii,
    required this.generationVii,
    required this.generationViii,
  });

  @JsonKey(name: 'generation-i')
  final GenerationI? generationI;

  @JsonKey(name: 'generation-v')
  final GenerationV? generationV;

  @JsonKey(name: 'generation-ii')
  final GenerationIi? generationIi;

  @JsonKey(name: 'generation-iv')
  final GenerationIv? generationIv;

  @JsonKey(name: 'generation-vi')
  final Map<String, Home>? generationVi;

  @JsonKey(name: 'generation-iii')
  final GenerationIii? generationIii;

  @JsonKey(name: 'generation-vii')
  final GenerationVii? generationVii;

  @JsonKey(name: 'generation-viii')
  final GenerationViii? generationViii;

  factory Versions.fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);

}

@JsonSerializable(createToJson: false)
class Other {
  Other({
    required this.home,
    required this.showdown,
    required this.dreamWorld,
    required this.officialArtwork,
  });

  final Home? home;
  final Sprites? showdown;

  @JsonKey(name: 'dream_world')
  final DreamWorld? dreamWorld;

  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

}

@JsonSerializable(createToJson: false)
class Sprites {
  Sprites({
    required this.other,
    required this.versions,
    required this.backShiny,
    required this.backFemale,
    required this.frontShiny,
    required this.backDefault,
    required this.frontFemale,
    required this.frontDefault,
    required this.backShinyFemale,
    required this.frontShinyFemale,
    required this.animated,
  });

  final Other? other;
  final Versions? versions;

  @JsonKey(name: 'back_shiny')
  final String? backShiny;

  @JsonKey(name: 'back_female')
  final String? backFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'back_default')
  final String? backDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;

  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
  final Sprites? animated;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

}

@JsonSerializable(createToJson: false)
class GenerationI {
  GenerationI({
    required this.yellow,
    required this.redBlue,
  });

  final RedBlue? yellow;

  @JsonKey(name: 'red-blue')
  final RedBlue? redBlue;

  factory GenerationI.fromJson(Map<String, dynamic> json) => _$GenerationIFromJson(json);

}

@JsonSerializable(createToJson: false)
class RedBlue {
  RedBlue({
    required this.backGray,
    required this.frontGray,
    required this.backDefault,
    required this.frontDefault,
    required this.backTransparent,
    required this.frontTransparent,
  });

  @JsonKey(name: 'back_gray')
  final String? backGray;

  @JsonKey(name: 'front_gray')
  final String? frontGray;

  @JsonKey(name: 'back_default')
  final String? backDefault;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'back_transparent')
  final String? backTransparent;

  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  factory RedBlue.fromJson(Map<String, dynamic> json) => _$RedBlueFromJson(json);

}

@JsonSerializable(createToJson: false)
class GenerationIi {
  GenerationIi({
    required this.gold,
    required this.silver,
    required this.crystal,
  });

  final Gold? gold;
  final Gold? silver;
  final Crystal? crystal;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => _$GenerationIiFromJson(json);

}

@JsonSerializable(createToJson: false)
class Crystal {
  Crystal({
    required this.backShiny,
    required this.frontShiny,
    required this.backDefault,
    required this.frontDefault,
    required this.backTransparent,
    required this.frontTransparent,
    required this.backShinyTransparent,
    required this.frontShinyTransparent,
  });

  @JsonKey(name: 'back_shiny')
  final String? backShiny;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'back_default')
  final String? backDefault;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'back_transparent')
  final String? backTransparent;

  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  @JsonKey(name: 'back_shiny_transparent')
  final String? backShinyTransparent;

  @JsonKey(name: 'front_shiny_transparent')
  final String? frontShinyTransparent;

  factory Crystal.fromJson(Map<String, dynamic> json) => _$CrystalFromJson(json);

}

@JsonSerializable(createToJson: false)
class Gold {
  Gold({
    required this.backShiny,
    required this.frontShiny,
    required this.backDefault,
    required this.frontDefault,
    required this.frontTransparent,
  });

  @JsonKey(name: 'back_shiny')
  final String? backShiny;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'back_default')
  final String? backDefault;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

}

@JsonSerializable(createToJson: false)
class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.rubySapphire,
    required this.fireredLeafgreen,
  });

  final OfficialArtwork? emerald;

  @JsonKey(name: 'ruby-sapphire')
  final Gold? rubySapphire;

  @JsonKey(name: 'firered-leafgreen')
  final Gold? fireredLeafgreen;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => _$GenerationIiiFromJson(json);

}

@JsonSerializable(createToJson: false)
class OfficialArtwork {
  OfficialArtwork({
    required this.frontShiny,
    required this.frontDefault,
  });

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => _$OfficialArtworkFromJson(json);

}

@JsonSerializable(createToJson: false)
class Home {
  Home({
    required this.frontShiny,
    required this.frontFemale,
    required this.frontDefault,
    required this.frontShinyFemale,
  });

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

}

@JsonSerializable(createToJson: false)
class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorld? icons;

  @JsonKey(name: 'ultra-sun-ultra-moon')
  final Home? ultraSunUltraMoon;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => _$GenerationViiFromJson(json);

}

@JsonSerializable(createToJson: false)
class DreamWorld {
  DreamWorld({
    required this.frontFemale,
    required this.frontDefault,
  });

  @JsonKey(name: 'front_female')
  final dynamic frontFemale;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => _$DreamWorldFromJson(json);

}

@JsonSerializable(createToJson: false)
class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  final DreamWorld? icons;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => _$GenerationViiiFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Pokemonegggroup {
  PokemonV2Pokemonegggroup({
    required this.pokemonV2Egggroup,
  });

  @JsonKey(name: 'pokemon_v2_egggroup')
  final PokemonV2? pokemonV2Egggroup;

  factory PokemonV2Pokemonegggroup.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonegggroupFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Pokemonspeciesname {
  PokemonV2Pokemonspeciesname({
    required this.genus,
  });

  final String? genus;

  factory PokemonV2Pokemonspeciesname.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonspeciesnameFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Pokemonstat {
  PokemonV2Pokemonstat({
    required this.baseStat,
    required this.pokemonV2Stat,
  });

  @JsonKey(name: 'base_stat')
  final int? baseStat;

  @JsonKey(name: 'pokemon_v2_stat')
  final PokemonV2? pokemonV2Stat;

  factory PokemonV2Pokemonstat.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemonstatFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Pokemontype {
  PokemonV2Pokemontype({
    required this.pokemonV2Type,
  });

  @JsonKey(name: 'pokemon_v2_type')
  final PokemonV2Type? pokemonV2Type;

  factory PokemonV2Pokemontype.fromJson(Map<String, dynamic> json) => _$PokemonV2PokemontypeFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2Type {
  PokemonV2Type({
    required this.id,
    required this.name,
    required this.pokemonV2TypeefficaciesByTargetTypeId,
  });

  final int? id;
  final String? name;
  final List<PokemonV2TypeefficaciesByTargetTypeId>? pokemonV2TypeefficaciesByTargetTypeId;

  factory PokemonV2Type.fromJson(Map<String, dynamic> json) => _$PokemonV2TypeFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokemonV2TypeefficaciesByTargetTypeId {
  PokemonV2TypeefficaciesByTargetTypeId({
    required this.damageFactor,
    required this.pokemonV2Type,
  });

  @JsonKey(name: 'damage_factor')
  final int? damageFactor;

  @JsonKey(name: 'pokemon_v2_type')
  final PokemonV2? pokemonV2Type;

  factory PokemonV2TypeefficaciesByTargetTypeId.fromJson(Map<String, dynamic> json) => _$PokemonV2TypeefficaciesByTargetTypeIdFromJson(json);

}
