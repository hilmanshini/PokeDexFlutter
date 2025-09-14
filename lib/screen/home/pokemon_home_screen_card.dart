import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:pokemon2/utils/ext.dart';
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
              Title(title: item.name?.capitalize() ?? ""),
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
    bottom: 0.dpValue(context),
    right: 0.dpValue(context),
    child: Visibility(visible: item.imagePath != null, child: Container(
      width: context.isPortrait ? 240.dpValue(context): 440.dpValue(context),
      height: context.isPortrait ? 240.dpValue(context):440.dpValue(context),
      child: Image.network( item.imagePath!,fit: BoxFit.fill,width: 300.dpValue(context),height: 300.dpValue(context)),
    )),
  );
}

class Title extends StatelessWidget {
  final String title;

  const Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 22.dpValue(context),
    left: 22.dpValue(context),
    child: Container(
      height: 65.dpValue(context),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "Larsseit",
          fontSize: 44.dpValue(context),
          color: Colors.white,
        ),
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
    top: 87.dpValue(context),
    left: 22.dpValue(context),
    child: Container(
      constraints: BoxConstraints(
        maxWidth: 40.w,
        maxHeight: 60.dpValue(context)
      ),
      alignment: Alignment.centerLeft,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: type.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(height: 10,width: 5,),
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
      width:0.4.dp,
      padding: EdgeInsets.symmetric( vertical: 0.2.h),

      decoration: BoxDecoration(
        color: Color(0x33ffffff), // transparent background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0x33ffffff).withAlpha(150), width: 0),
      ),
      child: Text(
        type.capitalize(),
        style: TextStyle(
          color: Colors.white.withAlpha(200), // label color
          fontSize: context.isWidthLess(800) ? 8:18,
          fontWeight: FontWeight.w600,
        ),
        textAlign:  TextAlign.center,
      ),
    );
  }
}