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



class HomepageFailure extends StatelessWidget {
  final Function() onReload;

  HomepageFailure({super.key, required this.onReload});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 25.h,
    child: SizedBox(
      width: 100.w,
      height: 75.h,
      child: Center(
        child: InkWell(
          onTap: () {
            onReload();
          },
          child: SizedBox(
            width: 10.w,
            height: 10.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // centers vertically
              children: const [
                Icon(Icons.signal_wifi_connected_no_internet_4_rounded),
                SizedBox(height: 8), // optional spacing
                Text("Error loading the data"),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class HomepageLoading extends StatefulWidget {
  const HomepageLoading({super.key});

  @override
  _HomepageLoadingState createState() => _HomepageLoadingState();
}

class _HomepageLoadingState extends State<HomepageLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.h),
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_animation.value),
              child: child,
            );
          },
          child: SvgPicture.asset(
            Assets.images.pokeball,
            width: 5.w,
            height: 5.w,
          ),
        ),
      ),
    );
  }
}
