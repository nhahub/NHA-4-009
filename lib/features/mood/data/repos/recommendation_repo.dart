import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/recommendation_model.dart';
import '../services/mood_local_service.dart';
import '../services/recommendation_local_service.dart';

class RecommendationRepo {
  final RecommendationLocalService _recommendationLocalService;

  RecommendationRepo({
    required RecommendationLocalService recommendationLocalService,
  }) : _recommendationLocalService = recommendationLocalService;

  Future<Either<Failure, RecommendationModel>> getRecommendationData() async {
    try {
      final moodName = MoodLocalService.getSelectedDailyMood();

      final RecommendationModel recommendationData =
          await _recommendationLocalService.getRecommendationData(
            moodName: moodName?.toLowerCase() ?? "calm",
          );

      return right(recommendationData);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
