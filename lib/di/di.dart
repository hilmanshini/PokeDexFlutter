import 'package:get_it/get_it.dart';
import 'package:pokemon2/service/repo/pokemon_graphql_repo.dart'
    show PokemonGraphqlRepo;
import 'package:pokemon2/service/service/graphql_service.dart'
    show GraphQLService;
import 'package:pokemon2/service/usecase/get_pokemon_list.dart'
    show GetPokemonList;

void registerDependencyInjection() {
  GetIt.instance.registerLazySingleton(
        () =>
        GraphQLService(endpoint: "http://127.0.0.1:3007", timeoutInSeconds: 60),
  );

  GetIt.instance.registerLazySingleton(
        () => PokemonGraphqlRepo(service: GetIt.instance.get()),
  );


  GetIt.instance.registerLazySingleton(() => GetPokemonList(
      repo: GetIt.instance.get()
  ));
}

T getDependency<T extends Object>() {
  return GetIt.instance.get<T>();
}
