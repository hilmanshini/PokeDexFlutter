import 'package:go_router/go_router.dart';
import 'package:pokemon2/screen/details/pokemon_detail_screen.dart';
import 'package:pokemon2/screen/home/pokemon_home_screen.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';

class Routes {
  static GoRouter routes = GoRouter(

    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => PokemonHomeScreen()),
      GoRoute(path: "/details", builder: (context, state){
        return PokemonDetailScreen(state.extra as PokemonModel);
      }),
    ],
  );
}
