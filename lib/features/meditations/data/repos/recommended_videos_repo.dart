import '../models/video_model.dart';
import '../services/recommended_videos_remote_service.dart';

class RecommendedVideosRepo {
  final RecommendedVideosRemoteService _recommendedVideosRemoteService;

  RecommendedVideosRepo({
    required RecommendedVideosRemoteService recommendedVideosRemoteService,
  }) : _recommendedVideosRemoteService = recommendedVideosRemoteService;

  Future<List<VideoModel>> getRecommendedVideos() async {
    return await _recommendedVideosRemoteService.getRecommendedVideos(mood: '');
  }
}
