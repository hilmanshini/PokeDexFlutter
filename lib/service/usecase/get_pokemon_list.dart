import 'dart:async';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:pokemon2/di/di.dart';
import 'package:pokemon2/service/common/result.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:pokemon2/service/repo/pokemon_graphql_repo.dart'
    show PokemonGraphqlRepo;
import 'package:pokemon2/utils/ext.dart';

class GetPokemonList {
  final PokemonGraphqlRepo repo;

  GetPokemonList({required this.repo});

  Stream<Result<List<PokemonModel>>> call<T>(int page) =>
      usecaseUi((controller, sink) async {
        sleep(Duration(seconds: 3));
        sink.add(Loading());
        var list = await repo.getPokemonList(page);
        sink.add(list);
        // controller.close();
      });
}
