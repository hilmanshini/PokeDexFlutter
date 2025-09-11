import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:sizer/sizer.dart';

import '../../gen/assets.gen.dart';

class PokemonHomeScreenCard extends StatelessWidget {
  final PokemonModel item;
  const PokemonHomeScreenCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      return Card(
        color: Color(item.color),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: InkWell(
          child: Stack(
            children: [
              BottomRightAsset(),
              Title(title: item.name ?? ""),
              PokeImage(item),
              TypeChips(type: item.types,),
            ],
          ),
          onTap: () {
            context.push("/details",extra: item);
          },
        ),
      );
    },
  );
}

class PokeImage extends StatelessWidget {
  final PokemonModel item;
  const PokeImage(this.item, {super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    bottom: 10,
    right: 10,
    child: Visibility(visible: item.imagePath != null, child: Container(
      width: 40.w.clamp(50, 200),
      height: 40.w.clamp(50, 200),
      child: Image.network( item.imagePath!,fit: BoxFit.fill,width: 900,height: 900),
    )),
  );
}

class Title extends StatelessWidget {
  final String title;

  const Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 2.h,
    left: 3.w,
    child: Text(
      title,
      style: TextStyle(
        fontFamily: "Larsseit",
        fontSize: 4.w.clamp(20, 40),
        color: Colors.white,
      ),
    ),
  );
}

class BottomRightAsset extends StatelessWidget {
  const BottomRightAsset({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    bottom: -10.w,
    right: -10.w,
    child: Assets.images.topRightIcon.image(
      color: Color(0x55ffffff),
      width: 40.w,
      height: 40.w,
    ),
  );
}

class TypeChips extends StatelessWidget {
  final List<String> type;
  const TypeChips({super.key, required this.type});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 8.h.clamp(40, 200),
    left: 3.w,
    child: Container(
      constraints: BoxConstraints(
        maxWidth: 30.w, // maksimal 30.w
      ),
      alignment: Alignment.centerLeft,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: type.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return Align(alignment: Alignment.centerLeft, child: TypeChip(type[index]));
        },
      ),
    ),
  );
}
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