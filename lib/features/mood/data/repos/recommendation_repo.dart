import '../models/recommendation_model.dart';
import '../services/mood_local_service.dart';
import '../services/recommendation_local_service.dart';

class RecommendationRepo {
  final RecommendationLocalService _recommendationLocalService;

  RecommendationRepo({
    required RecommendationLocalService recommendationLocalService,
  }) : _recommendationLocalService = recommendationLocalService;

  Future<RecommendationModel> getRecommendationData() async {
    final moodName = MoodLocalService.getSelectedDailyMood();

    final RecommendationModel recommendationData =
        await _recommendationLocalService.getRecommendationData(
          moodName: moodName?.toLowerCase() ?? "calm",
        );

    return recommendationData;
  }
}
