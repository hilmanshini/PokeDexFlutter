import 'package:flutter/material.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:pokemon2/utils/ext.dart';
import 'package:sizer/sizer.dart';

class PokemonEvolutionTab extends StatelessWidget {
  final PokemonModel model;
  const PokemonEvolutionTab({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth >= 600 ? 4 : 3;

        return GridView.builder(
          padding: EdgeInsets.only(left: 1.w,right: 1.w,top: 1.h,bottom: 8.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.95,
          ),
          itemCount: model.evolutions.length,
          itemBuilder: (context, index) {
            return Card(
              color: Color(model.color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(top: 35.dpValue(context)),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(
                          model.evolutions[index].imagePath,
                          width: 40.dpValue(context),
                          height: 40.dpValue(context),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.evolutions[index].name.capitalize(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}