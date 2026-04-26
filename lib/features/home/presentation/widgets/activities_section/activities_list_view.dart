import 'package:flutter/material.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../data/mock_data/meditations_for_you_data.dart';
import 'activity_card.dart';

class ActivitiesListView extends StatelessWidget {
  const ActivitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: activityCategoryModelData.length,
      itemBuilder: (context, index) {
        return ActivityCard(
          activityCategoryModel: activityCategoryModelData[index],
        );
      },
    );
  }
}
