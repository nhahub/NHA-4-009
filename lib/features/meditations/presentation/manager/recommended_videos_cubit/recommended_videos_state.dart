part of 'recommended_videos_cubit.dart';

sealed class RecommendedVideosState extends Equatable {
  const RecommendedVideosState();

  @override
  List<Object?> get props => [];
}

class RecommendedVideosLoadingState extends RecommendedVideosState {}

class RecommendedVideosLoadedState extends RecommendedVideosState {
  final List<VideoModel> recommendedVideos;

  const RecommendedVideosLoadedState({required this.recommendedVideos});

  @override
  List<Object?> get props => [recommendedVideos];
}

class RecommendedVideosFailureState extends RecommendedVideosState {
  final String message;
  const RecommendedVideosFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
