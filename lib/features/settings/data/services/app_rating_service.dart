import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/app_rating_model.dart';

class AppRatingService {
  final SupabaseCRUDService _supabaseCRUDService;

  AppRatingService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<void> submitRating({required AppRatingModel appRatingModel}) async {
    await _supabaseCRUDService.upsertData(
      table: kAppRatingsTable,
      onConflict: 'user_id',
      data: appRatingModel.toJson(),
    );
  }

  Future<AppRatingModel?> getUserRating() async {
    final res = await _supabaseCRUDService.getSingleRow(
      table: kAppRatingsTable,
      filters: {'user_id': getUser()!.userId},
    );
    if (res == null) return null;
    return AppRatingModel.fromJson(res);
  }
}
