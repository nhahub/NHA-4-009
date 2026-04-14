import '../mappers/mood_chart_mapper.dart';
import '../models/mood_chart.dart';
import '../services/mood_progress_service.dart';

class MoodProgressRepo {
  final MoodProgressService _moodProgressService;

  MoodProgressRepo({required MoodProgressService moodProgressService})
    : _moodProgressService = moodProgressService;

  // Week
  Future<List<MoodChart>> getCurrentWeekMood() async {
    final response = await _moodProgressService.getCurrentWeekMood();
    final List<MoodChart> result = MoodChartMapper.mapWeek(response);
    return result;
  }

  // Month
  Future<List<MoodChart>> getCurrentMonthMood() async {
    final response = await _moodProgressService.getCurrentMonthMood();
    final List<MoodChart> result = MoodChartMapper.mapMonth(response);
    return result;
  }

  // Year
  Future<List<MoodChart>> getCurrentYearMood() async {
    final response = await _moodProgressService.getCurrentYearMood();
    final List<MoodChart> result = MoodChartMapper.mapYear(response);
    return result;
  }
}
