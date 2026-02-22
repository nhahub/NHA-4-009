import 'package:flutter/material.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/calories_details.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/custom_details_header.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class CaloriesSection extends StatelessWidget {
  const CaloriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDetailsHeader(title: "Calories"),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                CaloriesDetails(
                  title: "Carbohydrates",
                  value: 51.7,
                  color: AppColors.lightGreen,
                ),
                CaloriesDetails(
                  title: "Proteins",
                  value: 16.2,
                  color: AppColors.yellow,
                ),
                CaloriesDetails(
                  title: "Fats",
                  value: 10.8,
                  color: AppColors.darkRed,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  "kcal",
                  style: AppStyles.semiBold17.copyWith(
                    color: AppColors.bodyGray,
                  ),
                ),
                const Text("384", style: AppStyles.extraBold27),
              ],
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
