import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import 'activities_header.dart';
import 'activities_list_view.dart';

class ActivitiesSection extends StatelessWidget {
  const ActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: kAppSectionSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ActivitiesHeader(), ActivitiesListView()],
    );
  }
}
