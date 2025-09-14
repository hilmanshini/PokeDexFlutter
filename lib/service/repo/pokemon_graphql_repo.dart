import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql/client.dart';
import 'package:pokemon2/gen/assets.gen.dart';
import 'package:pokemon2/service/common/result.dart';
import 'package:pokemon2/service/data/pokemon_response.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:pokemon2/service/repo/pokemon_repo.dart';
import 'package:pokemon2/service/service/graphql_service.dart';
import 'package:pokemon2/utils/ext.dart';

class PokemonGraphqlRepo implements PokemonRepo {
  GraphQLService service;

  PokemonGraphqlRepo({required this.service});

  @override
  Future<Result<List<PokemonModel>>> getPokemonList(
    int page, {
    int limit = 10,
  }) async {
    try {
      var result = await service.client.query(
        QueryOptions(
          document: gql(await rootBundle.loadString(Assets.query.listAll)),
          variables: {"offset": page * limit, "limit": limit},
        ),
      );
      if (result.hasException) {
        return Failure(result.exception!,result.exception!.originalStackTrace!);
      }
      var response = PokeResponse.fromJson((result.data ?? {}));
      var models = (response.pokemonV2Pokemon ?? []).map((e) {
        var genderMap = getGenderRatio(
          e.pokemonV2Pokemonspecy?.genderRate ?? -1,
        );

        return PokemonModel(
          defenseMatchups: [] ,
          offenseMatchups: [] ,
          evolutions: e.pokemonV2Pokemonspecy?.pokemonV2Evolutionchain?.pokemonV2Pokemonspecies?.map((e){

            return PokemonEvolution(name: e.name!, imagePath: e.pokemonV2Pokemons?.firstOrNull?.pokemonV2Pokemonsprites?.firstOrNull?.sprites!.frontDefault ?? "");
          }).toList() ?? [],
          imagePath: e.pokemonV2Pokemonsprites?.firstOrNull?.sprites?.frontDefault,
          defense: e.pokemonV2Pokemonstats
              ?.firstWhere((element) => element.pokemonV2Stat?.name == "defense")
              .baseStat,
          hp: e.pokemonV2Pokemonstats
              ?.firstWhere((element) => element.pokemonV2Stat?.name == "hp")
              .baseStat,
          attack: e.pokemonV2Pokemonstats
              ?.firstWhere((element) => element.pokemonV2Stat?.name == "attack")
              .baseStat,

          spAttack: e.pokemonV2Pokemonstats
              ?.firstWhere((element) => element.pokemonV2Stat?.name == "special-attack")
              .baseStat,

          spDef: e.pokemonV2Pokemonstats
              ?.firstWhere((element) => element.pokemonV2Stat?.name == "special-defense")
              .baseStat,
          speed: e.pokemonV2Pokemonstats
              ?.firstWhere((element) => element.pokemonV2Stat?.name == "speed")
                .baseStat,
          species:
              e.pokemonV2Pokemonspecy?.pokemonV2Pokemonspeciesnames?.firstOrNull?.genus ?? "",

          color:pokemonTypeColors[ e.pokemonV2Pokemontypes?.firstOrNull?.pokemonV2Type?.name] ?? Colors.white.toARGB32(),
          eggGroup:
              e
                  .pokemonV2Pokemonspecy
                  ?.pokemonV2Pokemonegggroups?[0]
                  .pokemonV2Egggroup
                  ?.name ??
              "",
          eggCycle:
              e
                  .pokemonV2Pokemonspecy
                  ?.pokemonV2Pokemonegggroups?.getOrNull(1)
                  ?.pokemonV2Egggroup
                  ?.name ??
              "",
          name: e.name ?? "",
          height: e.height,
          weight: e.weight,
          id: e.id ?? 0,
          abilities:
              e.pokemonV2Pokemonabilities
                  ?.map((e) => e.pokemonV2Ability?.name ?? "")
                  .toList() ??
              [],
          types:
              e.pokemonV2Pokemontypes
                  ?.map((e) => e.pokemonV2Type?.name ?? "")
                  .toList() ??
              [],
          maleBreedPercentage: genderMap["male"] ?? 0,
          femaleBreedPercentage: genderMap["female"] ?? 0,
        );
      });
      return Success(models.toList());
    } catch (e,stack) {
      return Failure(e,stack);
    }
  }

  Map<String, double> getGenderRatio(int genderRate) {
    if (genderRate == -1) {
      return {"male": 0, "female": 0}; // genderless
    }

    final female = (genderRate / 8) * 100;
    final male = 100 - female;

    return {"male": male, "female": female};
  }

  final Map<String, int> pokemonTypeColors = {
    'normal': Colors.brown[400]!.toARGB32(),
    'fire': Colors.redAccent.toARGB32(),
    'water': Colors.blueAccent.toARGB32(),
    'electric': Color(0xFFFDD835).toARGB32(),
    'grass': Colors.greenAccent.toARGB32(),
    'ice': Colors.cyanAccent.toARGB32(),
    'fighting': Colors.orangeAccent.toARGB32(),
    'poison': Colors.purpleAccent.toARGB32(),
    'ground': Colors.brown.toARGB32(),
    'flying': Colors.indigoAccent.toARGB32(),
    'psychic': Colors.pinkAccent.toARGB32(),
    'bug': Colors.lightGreenAccent.toARGB32(),
    'rock': Colors.grey.toARGB32(),
    'ghost': Colors.deepPurpleAccent.toARGB32(),
    'dragon': Colors.indigo.toARGB32(),
    'dark': Colors.black87.toARGB32(),
    'steel': Colors.blueGrey.toARGB32(),
    'fairy': Colors.pinkAccent.toARGB32(),
  };
}
