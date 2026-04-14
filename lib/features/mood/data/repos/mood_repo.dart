import '../../../../core/functions/user_data_local.dart';
import '../models/mood_model.dart';
import '../services/mood_remote_service.dart';

class MoodRepo {
  final MoodRemoteService _moodRemoteService;

  MoodRepo({required MoodRemoteService moodRemoteService})
    : _moodRemoteService = moodRemoteService;

  Future<void> saveCurrentMood({required String currentMood}) async {
    await _moodRemoteService.saveCurrentMood(
      moodModel: MoodModel(
        userId: getUser()!.userId,
        currentMood: currentMood,
        createdAt: DateTime.now(),
      ),
    );
  }
}
