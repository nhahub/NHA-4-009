import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'recommended_videos_bloc_builder.dart';

class RecommendedVideosSection extends StatelessWidget {
  const RecommendedVideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: kAppSectionSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "Recommended Videos"),
        RecommendedVideosBlocBuilder(),
      ],
    );
  }
}
