import 'dart:async';

import 'package:pokemon2/di/di.dart';
import 'package:pokemon2/service/common/result.dart';
import 'package:pokemon2/service/model/pokemon_model.dart' show PokemonModel;
import 'package:pokemon2/service/usecase/get_pokemon_list.dart';
import 'package:stacked/stacked.dart';

class PokemonHomeScreenViewmodel extends BaseViewModel{
  ReactiveValue<Result<List<PokemonModel>>> data = ReactiveValue(Idle());
  ReactiveValue<int> page = ReactiveValue(0);
  GetPokemonList getPokemonList = getDependency();



  void loadSync(){
    getPokemonList(page.value).listen((event) {
      data.value = event;
      notifyListeners();
    });
  }
}