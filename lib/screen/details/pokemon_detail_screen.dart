import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon2/gen/assets.gen.dart';
import 'package:pokemon2/screen/details/pokemon_about_tab.dart';
import 'package:pokemon2/screen/details/pokemon_base_stats_tab.dart';
import 'package:pokemon2/screen/details/pokemon_evolution_tab.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:sizer/sizer.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonModel model;

  const PokemonDetailScreen(this.model, {super.key});

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: true,
    onPopInvokedWithResult: (didPop, result) {
      // context.pop();
    },
    child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 10.h),
        child: PokemonDetailScreenAppBar(context: context),
      ),
      backgroundColor: Color(model.color),
      body: Stack(
        children: [
          PokemonBgOrnament(),
          Title(model),
          TypeChips(model),
          BottomCardBackground(model),
          PokeImage(model),
          IdText(model),
        ],
      ),
    ),
  );
}

class PokemonBgOrnament extends StatelessWidget {
  const PokemonBgOrnament({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 15.h,
    right: -11.h,
    width: 320,
    height: 320,
    child: Assets.images.topRightIcon.image(color: Color(0x33ffffff)),
  );
}

class PokemonDetailScreenAppBar extends AppBar {
  PokemonDetailScreenAppBar({super.key, required BuildContext context})
    : super(
        leading: appbarLeading(context),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        actions: appbarActions(context),
      ) {}

  static Widget? appbarLeading(BuildContext context) => Padding(
    padding: EdgeInsetsGeometry.only(left: 3.w, top: 2.5.h),
    child: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        Navigator.pop(context); // kembali ke halaman sebelumnya
      },
    ),
  );

  static List<Widget> appbarActions(BuildContext context) => [
    Padding(
      padding: EdgeInsetsGeometry.only(right: 5.w, top: 2.5.h),
      child: InkWell(child: Icon(Icons.favorite_outline, color: Colors.white),onTap: () {
        context.pop();
      }),
    ),
  ];
}

//reusable
class Title extends StatelessWidget {
  final PokemonModel model;
  const Title(this.model, {super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 1.h,
    left: 4.w,
    child: Text(
      model.name!,
      style: TextStyle(
        fontFamily: "Larsseit",
        fontSize: 5.h,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}

//reusable
class TypeChips extends StatelessWidget {
  final PokemonModel model;
  const TypeChips(this.model, {super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 7.h,
    left: 5.w,
    // left: 3.w,
    child: PreferredSize(
      preferredSize: Size(double.infinity, 6.h),
      child: Container(
        // color: Colors.green,
        constraints: BoxConstraints(
          maxHeight: 6.h, // maksimal 30.w
        ),
        alignment: Alignment.centerLeft,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: model.types.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemBuilder: (context, index) {
            return Align(alignment: Alignment.centerLeft, child: TypeChip(model.types[index]));
          },
        ),
      ),
    ),
  );
}

//reusable
class TypeChip extends StatelessWidget {
  final String type;
  const TypeChip(this.type, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width:9.w,
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.8.h),

      decoration: BoxDecoration(
        color: Color(0x33ffffff), // transparent background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0x33ffffff).withAlpha(150), width: 0),
      ),
      child: Text(
        type.toUpperCase(),
        style: TextStyle(
          color: Colors.white.withAlpha(200), // label color
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
        textAlign:  TextAlign.center,
      ),
    );
  }
}

class BottomCardBackground extends StatelessWidget {
  final PokemonModel model;
  const BottomCardBackground(this.model, {super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 35.h,
    left: 0,
    child: SizedBox(
      height: 55.h,
      width: 100.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        color: Colors.white,
        clipBehavior: Clip.none,
        elevation: 0,
        borderOnForeground: false,
        margin: EdgeInsets.zero,
        child: BottomCardTabBar(model),
      ),
    ),
  );
}

class BottomCardTabBar extends StatelessWidget {
  final PokemonModel model;
  const BottomCardTabBar(this.model, {super.key});

  @override
  Widget build(BuildContext context) =>
      DefaultTabController(length: 4, child: tabBarContent());

  Widget tabBarContent() => Padding(
    padding: EdgeInsets.only(top: 8.h),
    child: DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: TabBar(
              labelStyle: TextStyle(
                fontFamily: "Larsseit",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp
              ),
              unselectedLabelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: Colors.blue),
                insets: EdgeInsets.symmetric(
                  horizontal: -9.w,
                ), // 0 → full width tab
              ),
              tabs: [
                Tab(text: "About"),
                Tab(text: "Base Stats"),
                Tab(text: "Evolution"),
              ],
            ),
          ),
          // Tab view
          Expanded(
            child: TabBarView(
              children: [
                PokemonAboutTab(model),
                PokemonBaseStatsTab(model),
                PokemonEvolutionTab(model: model),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class IdText extends StatelessWidget {
  const IdText(PokemonModel model, {super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    right: 6.w,
    top: 5.w.clamp(50, double.infinity),
    child: Text(
      "#01",
      style: TextStyle(
        fontFamily: "Larsseit",
        // fontStyle: FontStyle.italic,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 6.w.clamp(10, 30)
      ),
    ),
  );
}

//reusable
class PokeImage extends StatelessWidget {
  final PokemonModel model;
  const PokeImage(this.model, {super.key});

  @override
  Widget build(BuildContext context) => Align(
    // top: 15.h,
    // left: 25.w,
    alignment: Alignment(0.0, -0.49),
    child: Container(
      width: 300,
      height: 300,
      child: Image.network(model.imagePath!,fit: BoxFit.fill,width: 300,height: 300,),
    ),
  );
}
