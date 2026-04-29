import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/mood_model.dart';

class MoodRemoteService {
  final SupabaseCRUDService _supabaseService;

  MoodRemoteService({required SupabaseCRUDService supabaseService})
    : _supabaseService = supabaseService;

  Future<void> saveCurrentMood({required MoodModel moodModel}) async {
    await _supabaseService.addData(table: kMoodTable, data: moodModel.toJson());
  }

  Future<MoodModel?> getCurrentMood() async {
    final Map<String, dynamic>? data = await _supabaseService.getSingleRow(
      table: kMoodTable,
      filters: {"user_id": getUser()!.userId},
      orderBy: 'created_at',
      ascending: false,
    );

    if (data == null || data.isEmpty) return null;

    final MoodModel moodModel = MoodModel.fromJson(data);
    return moodModel;
  }
}
