// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeResponse _$PokeResponseFromJson(Map<String, dynamic> json) => PokeResponse(
  pokemonV2Pokemon: (json['pokemon_v2_pokemon'] as List<dynamic>?)
      ?.map((e) => PokePokemonV2Pokemon.fromJson(e as Map<String, dynamic>))
      .toList(),
);

PokePokemonV2Pokemon _$PokePokemonV2PokemonFromJson(
  Map<String, dynamic> json,
) => PokePokemonV2Pokemon(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  height: (json['height'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  pokemonV2Pokemonsprites: (json['pokemon_v2_pokemonsprites'] as List<dynamic>?)
      ?.map((e) => PokemonV2Pokemonsprite.fromJson(e as Map<String, dynamic>))
      .toList(),
  pokemonV2Pokemonabilities:
      (json['pokemon_v2_pokemonabilities'] as List<dynamic>?)
          ?.map(
            (e) => PokemonV2Pokemonability.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  pokemonV2Pokemonstats: (json['pokemon_v2_pokemonstats'] as List<dynamic>?)
      ?.map((e) => PokemonV2Pokemonstat.fromJson(e as Map<String, dynamic>))
      .toList(),
  pokemonV2Pokemontypes: (json['pokemon_v2_pokemontypes'] as List<dynamic>?)
      ?.map((e) => PokemonV2Pokemontype.fromJson(e as Map<String, dynamic>))
      .toList(),
  pokemonV2Pokemonspecy: json['pokemon_v2_pokemonspecy'] == null
      ? null
      : PokemonV2PokemonPokemonV2Pokemonspecy.fromJson(
          json['pokemon_v2_pokemonspecy'] as Map<String, dynamic>,
        ),
  pokemonV2Pokemonmoves: (json['pokemon_v2_pokemonmoves'] as List<dynamic>?)
      ?.map((e) => PokemonV2Pokemonmove.fromJson(e as Map<String, dynamic>))
      .toList(),
);

PokemonV2Pokemonability _$PokemonV2PokemonabilityFromJson(
  Map<String, dynamic> json,
) => PokemonV2Pokemonability(
  pokemonV2Ability: json['pokemon_v2_ability'] == null
      ? null
      : PokemonV2.fromJson(json['pokemon_v2_ability'] as Map<String, dynamic>),
);

PokemonV2 _$PokemonV2FromJson(Map<String, dynamic> json) =>
    PokemonV2(name: json['name'] as String?);

PokemonV2Pokemonmove _$PokemonV2PokemonmoveFromJson(
  Map<String, dynamic> json,
) => PokemonV2Pokemonmove(
  level: (json['level'] as num?)?.toInt(),
  moveLearnMethodId: (json['move_learn_method_id'] as num?)?.toInt(),
  pokemonV2Move: json['pokemon_v2_move'] == null
      ? null
      : PokemonV2Move.fromJson(json['pokemon_v2_move'] as Map<String, dynamic>),
);

PokemonV2Move _$PokemonV2MoveFromJson(Map<String, dynamic> json) =>
    PokemonV2Move(
      name: json['name'] as String?,
      power: (json['power'] as num?)?.toInt(),
      accuracy: (json['accuracy'] as num?)?.toInt(),
      pp: (json['pp'] as num?)?.toInt(),
      pokemonV2Type: json['pokemon_v2_type'] == null
          ? null
          : PokemonV2.fromJson(json['pokemon_v2_type'] as Map<String, dynamic>),
    );

PokemonV2PokemonPokemonV2Pokemonspecy
_$PokemonV2PokemonPokemonV2PokemonspecyFromJson(
  Map<String, dynamic> json,
) => PokemonV2PokemonPokemonV2Pokemonspecy(
  genderRate: (json['gender_rate'] as num?)?.toInt(),
  hatchCounter: (json['hatch_counter'] as num?)?.toInt(),
  pokemonV2Pokemonegggroups:
      (json['pokemon_v2_pokemonegggroups'] as List<dynamic>?)
          ?.map(
            (e) => PokemonV2Pokemonegggroup.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  pokemonV2Pokemonspeciesnames:
      (json['pokemon_v2_pokemonspeciesnames'] as List<dynamic>?)
          ?.map(
            (e) =>
                PokemonV2Pokemonspeciesname.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  pokemonV2Evolutionchain: json['pokemon_v2_evolutionchain'] == null
      ? null
      : PokemonV2Evolutionchain.fromJson(
          json['pokemon_v2_evolutionchain'] as Map<String, dynamic>,
        ),
);

PokemonV2Evolutionchain _$PokemonV2EvolutionchainFromJson(
  Map<String, dynamic> json,
) => PokemonV2Evolutionchain(
  pokemonV2Pokemonspecies: (json['pokemon_v2_pokemonspecies'] as List<dynamic>?)
      ?.map(
        (e) => PokemonV2PokemonspecyElement.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

PokemonV2PokemonspecyElement _$PokemonV2PokemonspecyElementFromJson(
  Map<String, dynamic> json,
) => PokemonV2PokemonspecyElement(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  pokemonV2Pokemons: (json['pokemon_v2_pokemons'] as List<dynamic>?)
      ?.map(
        (e) => PokemonV2PokemonspecyPokemonV2Pokemon.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

PokemonV2PokemonspecyPokemonV2Pokemon
_$PokemonV2PokemonspecyPokemonV2PokemonFromJson(
  Map<String, dynamic> json,
) => PokemonV2PokemonspecyPokemonV2Pokemon(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  pokemonV2Pokemonsprites: (json['pokemon_v2_pokemonsprites'] as List<dynamic>?)
      ?.map((e) => PokemonV2Pokemonsprite.fromJson(e as Map<String, dynamic>))
      .toList(),
);

PokemonV2Pokemonsprite _$PokemonV2PokemonspriteFromJson(
  Map<String, dynamic> json,
) => PokemonV2Pokemonsprite(
  sprites: json['sprites'] == null
      ? null
      : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
);

GenerationV _$GenerationVFromJson(Map<String, dynamic> json) => GenerationV(
  blackWhite: json['black-white'] == null
      ? null
      : Sprites.fromJson(json['black-white'] as Map<String, dynamic>),
);

GenerationIv _$GenerationIvFromJson(Map<String, dynamic> json) => GenerationIv(
  platinum: json['platinum'] == null
      ? null
      : Sprites.fromJson(json['platinum'] as Map<String, dynamic>),
  diamondPearl: json['diamond-pearl'] == null
      ? null
      : Sprites.fromJson(json['diamond-pearl'] as Map<String, dynamic>),
  heartgoldSoulsilver: json['heartgold-soulsilver'] == null
      ? null
      : Sprites.fromJson(json['heartgold-soulsilver'] as Map<String, dynamic>),
);

Versions _$VersionsFromJson(Map<String, dynamic> json) => Versions(
  generationI: json['generation-i'] == null
      ? null
      : GenerationI.fromJson(json['generation-i'] as Map<String, dynamic>),
  generationV: json['generation-v'] == null
      ? null
      : GenerationV.fromJson(json['generation-v'] as Map<String, dynamic>),
  generationIi: json['generation-ii'] == null
      ? null
      : GenerationIi.fromJson(json['generation-ii'] as Map<String, dynamic>),
  generationIv: json['generation-iv'] == null
      ? null
      : GenerationIv.fromJson(json['generation-iv'] as Map<String, dynamic>),
  generationVi: (json['generation-vi'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, Home.fromJson(e as Map<String, dynamic>)),
  ),
  generationIii: json['generation-iii'] == null
      ? null
      : GenerationIii.fromJson(json['generation-iii'] as Map<String, dynamic>),
  generationVii: json['generation-vii'] == null
      ? null
      : GenerationVii.fromJson(json['generation-vii'] as Map<String, dynamic>),
  generationViii: json['generation-viii'] == null
      ? null
      : GenerationViii.fromJson(
          json['generation-viii'] as Map<String, dynamic>,
        ),
);

Other _$OtherFromJson(Map<String, dynamic> json) => Other(
  home: json['home'] == null
      ? null
      : Home.fromJson(json['home'] as Map<String, dynamic>),
  showdown: json['showdown'] == null
      ? null
      : Sprites.fromJson(json['showdown'] as Map<String, dynamic>),
  dreamWorld: json['dream_world'] == null
      ? null
      : DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>),
  officialArtwork: json['official-artwork'] == null
      ? null
      : OfficialArtwork.fromJson(
          json['official-artwork'] as Map<String, dynamic>,
        ),
);

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
  other: json['other'] == null
      ? null
      : Other.fromJson(json['other'] as Map<String, dynamic>),
  versions: json['versions'] == null
      ? null
      : Versions.fromJson(json['versions'] as Map<String, dynamic>),
  backShiny: json['back_shiny'] as String?,
  backFemale: json['back_female'] as String?,
  frontShiny: json['front_shiny'] as String?,
  backDefault: json['back_default'] as String?,
  frontFemale: json['front_female'] as String?,
  frontDefault: json['front_default'] as String?,
  backShinyFemale: json['back_shiny_female'] as String?,
  frontShinyFemale: json['front_shiny_female'] as String?,
  animated: json['animated'] == null
      ? null
      : Sprites.fromJson(json['animated'] as Map<String, dynamic>),
);

GenerationI _$GenerationIFromJson(Map<String, dynamic> json) => GenerationI(
  yellow: json['yellow'] == null
      ? null
      : RedBlue.fromJson(json['yellow'] as Map<String, dynamic>),
  redBlue: json['red-blue'] == null
      ? null
      : RedBlue.fromJson(json['red-blue'] as Map<String, dynamic>),
);

RedBlue _$RedBlueFromJson(Map<String, dynamic> json) => RedBlue(
  backGray: json['back_gray'] as String?,
  frontGray: json['front_gray'] as String?,
  backDefault: json['back_default'] as String?,
  frontDefault: json['front_default'] as String?,
  backTransparent: json['back_transparent'] as String?,
  frontTransparent: json['front_transparent'] as String?,
);

GenerationIi _$GenerationIiFromJson(Map<String, dynamic> json) => GenerationIi(
  gold: json['gold'] == null
      ? null
      : Gold.fromJson(json['gold'] as Map<String, dynamic>),
  silver: json['silver'] == null
      ? null
      : Gold.fromJson(json['silver'] as Map<String, dynamic>),
  crystal: json['crystal'] == null
      ? null
      : Crystal.fromJson(json['crystal'] as Map<String, dynamic>),
);

Crystal _$CrystalFromJson(Map<String, dynamic> json) => Crystal(
  backShiny: json['back_shiny'] as String?,
  frontShiny: json['front_shiny'] as String?,
  backDefault: json['back_default'] as String?,
  frontDefault: json['front_default'] as String?,
  backTransparent: json['back_transparent'] as String?,
  frontTransparent: json['front_transparent'] as String?,
  backShinyTransparent: json['back_shiny_transparent'] as String?,
  frontShinyTransparent: json['front_shiny_transparent'] as String?,
);

Gold _$GoldFromJson(Map<String, dynamic> json) => Gold(
  backShiny: json['back_shiny'] as String?,
  frontShiny: json['front_shiny'] as String?,
  backDefault: json['back_default'] as String?,
  frontDefault: json['front_default'] as String?,
  frontTransparent: json['front_transparent'] as String?,
);

GenerationIii _$GenerationIiiFromJson(Map<String, dynamic> json) =>
    GenerationIii(
      emerald: json['emerald'] == null
          ? null
          : OfficialArtwork.fromJson(json['emerald'] as Map<String, dynamic>),
      rubySapphire: json['ruby-sapphire'] == null
          ? null
          : Gold.fromJson(json['ruby-sapphire'] as Map<String, dynamic>),
      fireredLeafgreen: json['firered-leafgreen'] == null
          ? null
          : Gold.fromJson(json['firered-leafgreen'] as Map<String, dynamic>),
    );

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) =>
    OfficialArtwork(
      frontShiny: json['front_shiny'] as String?,
      frontDefault: json['front_default'] as String?,
    );

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
  frontShiny: json['front_shiny'] as String?,
  frontFemale: json['front_female'] as String?,
  frontDefault: json['front_default'] as String?,
  frontShinyFemale: json['front_shiny_female'] as String?,
);

GenerationVii _$GenerationViiFromJson(Map<String, dynamic> json) =>
    GenerationVii(
      icons: json['icons'] == null
          ? null
          : DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
      ultraSunUltraMoon: json['ultra-sun-ultra-moon'] == null
          ? null
          : Home.fromJson(json['ultra-sun-ultra-moon'] as Map<String, dynamic>),
    );

DreamWorld _$DreamWorldFromJson(Map<String, dynamic> json) => DreamWorld(
  frontFemale: json['front_female'],
  frontDefault: json['front_default'] as String?,
);

GenerationViii _$GenerationViiiFromJson(Map<String, dynamic> json) =>
    GenerationViii(
      icons: json['icons'] == null
          ? null
          : DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
    );

PokemonV2Pokemonegggroup _$PokemonV2PokemonegggroupFromJson(
  Map<String, dynamic> json,
) => PokemonV2Pokemonegggroup(
  pokemonV2Egggroup: json['pokemon_v2_egggroup'] == null
      ? null
      : PokemonV2.fromJson(json['pokemon_v2_egggroup'] as Map<String, dynamic>),
);

PokemonV2Pokemonspeciesname _$PokemonV2PokemonspeciesnameFromJson(
  Map<String, dynamic> json,
) => PokemonV2Pokemonspeciesname(genus: json['genus'] as String?);

PokemonV2Pokemonstat _$PokemonV2PokemonstatFromJson(
  Map<String, dynamic> json,
) => PokemonV2Pokemonstat(
  baseStat: (json['base_stat'] as num?)?.toInt(),
  pokemonV2Stat: json['pokemon_v2_stat'] == null
      ? null
      : PokemonV2.fromJson(json['pokemon_v2_stat'] as Map<String, dynamic>),
);

PokemonV2Pokemontype _$PokemonV2PokemontypeFromJson(
  Map<String, dynamic> json,
) => PokemonV2Pokemontype(
  pokemonV2Type: json['pokemon_v2_type'] == null
      ? null
      : PokemonV2Type.fromJson(json['pokemon_v2_type'] as Map<String, dynamic>),
);

PokemonV2Type _$PokemonV2TypeFromJson(Map<String, dynamic> json) =>
    PokemonV2Type(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      pokemonV2TypeefficaciesByTargetTypeId:
          (json['pokemonV2TypeefficaciesByTargetTypeId'] as List<dynamic>?)
              ?.map(
                (e) => PokemonV2TypeefficaciesByTargetTypeId.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );

PokemonV2TypeefficaciesByTargetTypeId
_$PokemonV2TypeefficaciesByTargetTypeIdFromJson(Map<String, dynamic> json) =>
    PokemonV2TypeefficaciesByTargetTypeId(
      damageFactor: (json['damage_factor'] as num?)?.toInt(),
      pokemonV2Type: json['pokemon_v2_type'] == null
          ? null
          : PokemonV2.fromJson(json['pokemon_v2_type'] as Map<String, dynamic>),
    );
