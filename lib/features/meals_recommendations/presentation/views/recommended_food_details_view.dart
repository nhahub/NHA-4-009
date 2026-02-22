import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/meals_recommendations/data/models/recommended_food_item_model.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/calories_section.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/effects_section.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/nutrients_section.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/recommended_food_card.dart';

class RecommendedFoodDetailsView extends StatelessWidget {
  final RecommendedFoodItemModel recommendedFoodItemModel;

  const RecommendedFoodDetailsView({
    super.key,
    required this.recommendedFoodItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Food Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            spacing: kAppSectionSpacing,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecommendedFoodCard(
                recommendedFoodItemModel: recommendedFoodItemModel,
              ),
              const EffectsSection(
                effects:
                    "Nutrition directly affects mood, energy, and emotional balance. The right food choices can improve well-being, while poor choices may increase stress.",
              ),
              const CaloriesSection(),
              NutrientsSection(nutrients: recommendedFoodItemModel.nutrients),
            ],
          ),
        ),
      ),
    );
  }
}
