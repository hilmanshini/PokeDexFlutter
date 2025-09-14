import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:sizer/sizer.dart';

class PokemonBaseStatsTab extends StatelessWidget {
  final PokemonModel model;
  PokemonBaseStatsTab(this.model, {super.key});

  final TextStyle textStyleLabel = TextStyle(
    fontFamily: "Larsseit",
    fontWeight: FontWeight.w400,
    color: Color(0x881e1e1e),
    fontSize: 15.sp.clamp(14, 18),
  );

  final TextStyle textStyleText = TextStyle(
    fontFamily: "Larsseit",
    fontWeight: FontWeight.w600,
    fontSize: 15.sp.clamp(14, 18),
  );

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(left: 5.w, right:5.w,top: 1.h),
    child: ListView(
      children: [
        rowItem("HP", model.hp!),
        rowItem("Attack", model.attack!),
        rowItem("Defense", model.defense!),
        rowItem("Sp Attack", model.spAttack!),
        rowItem("Sp Def", model.spDef!),
        rowItem("Speed", model.speed!),
        rowItem("Total", model.totalStats(),visibleProgress: false),
        SizedBox(height: 5.h)
        // sectionTitle("Type Defenses"),
        // captionTitle("asdasd asdasd \n \n \n asda dasd asd"),
      ],
    ),
  );

  Widget rowItem(String label, int value,{bool visibleProgress = true}) => Padding(
    padding: EdgeInsets.symmetric(vertical: 0.7.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
          child: Text(label, style: textStyleLabel),
        ),
        Expanded(
          child: Row(
            children: [
              Text("$value", style: textStyleText),
              visibleProgress ? Expanded(
                child: Padding(
                  padding:  EdgeInsetsGeometry.only(left: 4.w),
                  child: LinearProgressIndicator(
                    value: value / 100, // harus 0.0 - 1.0
                    color: value < 50 ? Colors.red : Colors.green,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              ):Container(),
            ],
          ),
        ),
      ],
    ),
  );

  Widget sectionTitle(String title) => Padding(
    padding: EdgeInsets.only(top: 2.h,bottom: 0.3.h),
    child: Text(
      title,
      style: textStyleText.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
    ),
  );

  Widget captionTitle(String title) => Padding(
    padding: EdgeInsets.only(top: 2.h,bottom: 0.3.h),
    child: Text(
      title,
      style: textStyleLabel.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
    ),
  );
}
