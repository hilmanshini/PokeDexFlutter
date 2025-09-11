import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon2/gen/assets.gen.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:pokemon2/utils/ext.dart';
import 'package:sizer/sizer.dart';

class PokemonAboutTab extends StatelessWidget {
  PokemonModel model;

  PokemonAboutTab(this.model, {super.key});

  final TextStyle textStyleLabel = TextStyle(
    fontFamily: "Larsseit",
    fontWeight: FontWeight.w400,
    color: Color(0x881e1e1e),
    fontSize: 15.sp.clamp(14, 18),
  );

  final TextStyle textStyleText = TextStyle(
    fontFamily: "Larsseit",
    fontWeight: FontWeight.w500,
    color: Color(0xaa1e1e1e),
    fontSize: 15.sp.clamp(14, 18),
  );

  double heightInMeters(int heightInDm) => heightInDm * 0.1;

  double weightInKg(int weightInHg) => weightInHg * 0.1;

  double heightInFeet(int heightInDm) => heightInDm * 0.328084;

  double weightInLbs(int weightInHg) => weightInHg * 0.220462;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowItem("Species", "${model.species?.capitalize()}"),
          rowItem(
            "Height",
            model.height == null
                ? "-"
                : "${heightInMeters(model.height!).toStringAsFixed(2)}m (${heightInFeet(model.height!).toStringAsFixed(2)}ft)",
          ),
          rowItem(
            "Weight",
            model.weight == null
                ? "-"
                : "${weightInKg(model.weight!).toStringAsFixed(2)}kg (${weightInLbs(model.weight!).toStringAsFixed(2)}lbs)",
          ),
          rowItem("Abilities", model.abilities.map((e) => e.capitalize()).join(", ")),
          sectionTitle("Breeding"),
          genderRow(model.maleBreedPercentage!, model.femaleBreedPercentage!),
          rowItem("Egg Groups", model.eggGroup!.capitalize()),
          rowItem("Egg Cycle", model.eggCycle!.capitalize()),
        ],
      ),
    ),
  );

  Widget rowItem(String label, String value) => Padding(
    padding: EdgeInsets.symmetric(vertical: 0.7.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
          child: Text(label, style: textStyleLabel),
        ),
        Expanded(child: Text(value, style: textStyleText)),
      ],
    ),
  );

  //reusable
  Widget sectionTitle(String title) => Padding(
    padding: EdgeInsets.only(top: 2.h, bottom: 0.3.h),
    child: Text(
      title,
      style: textStyleText.copyWith(fontSize: 21, fontWeight: FontWeight.w600),
    ),
  );

  Widget genderRow(double? male, double? female) => Padding(
    padding: EdgeInsets.symmetric(vertical: 0.2.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
          child: Text("Gender", style: textStyleLabel),
        ),
        Visibility(
          visible: male != null,
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: SvgPicture.asset(
                    Assets.images.male,
                    width: 16,
                    height: 16,
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                  text: " ${male!}%",
                  style: textStyleLabel.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: female != null,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SvgPicture.asset(
                      Assets.images.female,
                      width: 16,
                      height: 16,
                    ),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text: " ${female}%",
                    style: textStyleLabel.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
