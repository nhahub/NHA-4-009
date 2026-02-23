import 'package:flutter/material.dart';

import '../../../../core/helpers/get_random_color.dart';
import '../../../../core/widgets/shared/category_container.dart';
import 'custom_details_header.dart';

class NutrientsSection extends StatelessWidget {
  final List<String> nutrients;
  const NutrientsSection({super.key, required this.nutrients});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDetailsHeader(title: "Nutrients"),
        Row(
          spacing: 8,
          children: nutrients
              .map(
                (nutrient) => CategoryContainer(
                  categoryTitle: nutrient,
                  color: getRandomColor(index: nutrients.indexOf(nutrient)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
