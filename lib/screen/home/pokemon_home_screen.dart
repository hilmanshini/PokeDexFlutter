import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon2/gen/assets.gen.dart';
import 'package:pokemon2/screen/home/pokemon_grid.dart' show PokeGrid;
import 'package:pokemon2/screen/home/pokemon_home_screen_viewmodel.dart';
import 'package:pokemon2/service/common/result.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class PokemonHomeScreen extends StatelessWidget {
  const PokemonHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PokemonHomeScreenViewmodel>.reactive(
      viewModelBuilder: () => PokemonHomeScreenViewmodel(),
      builder: (context, viewModel, child) => Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            TopRightBackground(),
            Title(),
            PokeGrid(viewModel),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 12.h,
    left: 2.w,
    child: Text(
      "Pokedex",
      style: TextStyle(
        fontFamily: "Larsseit",
        fontSize: 5.h,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

class TopRightBackground extends StatelessWidget {
  const TopRightBackground({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    top: -100,
    right: -200,

    child: Container(
      width: 500,
      height: 500,
      child: Assets.images.topRightIcon.image(color: Color(0x1e1e1e1e)),
    ),
  );
}


