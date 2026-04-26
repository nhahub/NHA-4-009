import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/features/home/data/models/activity/activity_category_model.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../manager/activities_cubit/activities_cubit.dart';
import '../../../../../core/widgets/shared/category_container.dart';

class ActivityCategoryCard extends StatelessWidget {
  final ActivityCategoryModel activityCategoryModel;

  const ActivityCategoryCard({super.key, required this.activityCategoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<ActivitiesCubit>();
        final categoryId = activityCategoryModel.id;
        context.push(
          Routes.activitiesView,
          args: {'categoryId': categoryId, 'cubit': cubit},
        );
      },
      child: AspectRatio(
        aspectRatio: 242 / 254,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 217, 253, 226),
                Color.fromARGB(255, 176, 247, 195),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 221, 250, 223),
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SvgPicture.asset(
                    activityCategoryModel.imageUrl,
                    width: 140,
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 22,
                child: CategoryContainer(
                  categoryTitle: activityCategoryModel.name,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
