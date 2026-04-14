import '../models/app_rating_model.dart';
import '../services/app_rating_local_service.dart';
import '../services/app_rating_service.dart';

class AppRatingRepo {
  final AppRatingService _appRatingService;
  final AppRatingLocalService _appRatingLocalService;

  AppRatingRepo({
    required AppRatingService appRatingService,
    required AppRatingLocalService appRatingLocalService,
  }) : _appRatingLocalService = appRatingLocalService,
       _appRatingService = appRatingService;

  /// Submit or update rating
  Future<void> submitRating({required AppRatingModel appRatingModel}) async {
    await _appRatingService.submitRating(appRatingModel: appRatingModel);
    await _appRatingLocalService.cacheUserRating(appRatingModel);
  }

  /// Get current user rating
  Future<AppRatingModel?> getUserRating({bool forceRefresh = false}) async {
    // Try local first
    if (!forceRefresh) {
      final cached = _appRatingLocalService.getCachedUserRating();
      if (cached != null) {
        return cached;
      }
    }
    // API call
    final result = await _appRatingService.getUserRating();

    // cache result
    if (result != null) {
      await _appRatingLocalService.cacheUserRating(result);
    }
    return result;
  }
}
