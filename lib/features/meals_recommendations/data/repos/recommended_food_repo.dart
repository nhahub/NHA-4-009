import '../../../mood/data/services/mood_local_service.dart';
import '../../domain/enums/food_type.dart';
import '../../domain/enums/mood_type.dart';
import '../local_service/recommended_food_local_service.dart';
import '../models/recommended_food_item_model.dart';
import '../models/recommended_food_lists_model.dart';

class RecommendedFoodRepo {
  final RecommendedFoodLocalService _localService;

  RecommendedFoodRepo({required RecommendedFoodLocalService localService})
    : _localService = localService;

  Future<List<RecommendedFoodItemModel>> getRecommendedFood({
    required FoodType foodType,
  }) async {
    final String selectedDailyMood =
        MoodLocalService.getSelectedDailyMood() ?? "Calm";
    final data = await _localService.getRecommendedFoodData(
      moodType: moodTypeFromString(selectedDailyMood),
    );
    return data.getListByFoodType(foodType: foodType);
  }
}
