import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/dummy/dummy_videos.dart';
import '../../../data/models/video_model.dart';
import '../../manager/recommended_videos_cubit/recommended_videos_cubit.dart';
import 'recommended_videos_list_view.dart';

class RecommendedVideosBlocBuilder extends StatelessWidget {
  const RecommendedVideosBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedVideosCubit, RecommendedVideosState>(
      builder: (context, state) {
        switch (state) {
          case RecommendedVideosLoadingState():
            return RecommendedVideosListView(
              recommendedVideos: DummyVideos.dummyVideos,
              isLoading: true,
            );
          case RecommendedVideosLoadedState(
            recommendedVideos: final List<VideoModel> recommendedVideos,
          ):
            return RecommendedVideosListView(
              recommendedVideos: recommendedVideos,
            );
          case RecommendedVideosFailureState(message: final String message):
            return CustomErrorWidget(message: message);
        }
      },
    );
  }
}
