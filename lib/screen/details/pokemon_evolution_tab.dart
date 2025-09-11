import 'package:flutter/material.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';

class PokemonEvolutionTab extends StatelessWidget {
  final PokemonModel model;
  const PokemonEvolutionTab({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // If width >= 600 → 4 columns, else 2
        int crossAxisCount = constraints.maxWidth >= 600 ? 4 : 2;

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75, // Taller cells for image + text
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
                  // Image section
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        model.evolutions[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Title section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.evolutions[index].name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
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