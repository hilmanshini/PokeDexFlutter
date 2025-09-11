import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon2/route/pokemon_back_button_dispatcher.dart';
import 'package:pokemon2/route/routes.dart';
import 'package:pokemon2/screen/home/pokemon_home_screen.dart';
import 'package:sizer/sizer.dart';

class PokemonAppWidget extends StatelessWidget {
  const PokemonAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (ctx, orientation, type) => MaterialApp.router(
        routerConfig: Routes.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
