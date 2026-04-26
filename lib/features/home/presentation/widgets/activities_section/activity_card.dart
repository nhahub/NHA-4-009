import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/features/home/data/models/activity/activity_category_model.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/shared/card_description_container.dart';
// import '../../../../../core/widgets/shared/category_container.dart';

class ActivityCard extends StatelessWidget {
  final ActivityCategoryModel activityCategoryModel;

  const ActivityCard({super.key, required this.activityCategoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.activitiesView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              // padding: const EdgeInsets.only(top: 54),
              padding: const EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SvgPicture.asset(activityCategoryModel.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CardDescriptionContainer(
                title: activityCategoryModel.name,
                withDuration: false,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(22),
            //   child: CategoryContainer(
            //     categoryTitle: activityCategoryModel.name,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
