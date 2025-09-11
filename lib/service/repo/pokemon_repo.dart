import 'package:pokemon2/service/common/result.dart';
import 'package:pokemon2/service/model/pokemon_model.dart' show PokemonModel;

abstract interface class  PokemonRepo {
  Future<Result<List<PokemonModel>>> getPokemonList(int page,{int limit = 10});
}