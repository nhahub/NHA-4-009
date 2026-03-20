import 'package:moodly/core/functions/get_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/enums/emoji_range.dart';
import '../models/mood_chart.dart';

class MoodProgressRepo {
  final SupabaseClient supabase;

  MoodProgressRepo({required this.supabase});

  Future<List<MoodChart>> getCurrentWeekMood() async {
    final response = await supabase.rpc(
      'get_current_week_moods',
      params: {'p_user_id': getUser()!.userId},
    );

    return mapToWeekMood(response);
  }

  Future<List<MoodChart>> getCurrentMonthMood() async {
    final response = await supabase.rpc(
      'get_current_month_moods',
      params: {'p_user_id': getUser()!.userId},
    );

    return mapToWeekMood(response);
  }

  Future<List<MoodChart>> getCurrentYearMood() async {
    final response = await supabase.rpc(
      'get_current_year_moods',
      params: {'p_user_id': getUser()!.userId},
    );

    return mapToWeekMood(response);
  }

  List<MoodChart> mapToWeekMood(List<dynamic> data) {
    final Map<int, MoodChart> result = {};

    for (var item in data) {
      final date = DateTime.parse(item['day']);
      final weekday = date.weekday; // 1 = Monday

      result[weekday] = MoodChart(
        label: getDayName(weekday),
        value: (item['count'] as int).toDouble(),
        emoji: mapMoodToEmoji(item['current_mood']),
      );
    }

    // fill missing days
    return List.generate(7, (index) {
      final day = index + 1;
      return result[day] ??
          MoodChart(
            label: getDayName(day),
            value: 0,
            emoji: mapMoodToEmoji('neutral'),
          );
    });
  }

  String getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String mapMoodToEmoji(String mood) {
    switch (mood) {
      case 'Angry':
        return EmojiRange.veryBad.emoji;
      case 'Anxious':
        return EmojiRange.bad.emoji;
      case 'Neutral':
        return EmojiRange.neutral.emoji;
      case 'Calm':
        return EmojiRange.good.emoji;
      case 'Happy':
        return EmojiRange.veryGood.emoji;
      default:
        return EmojiRange.neutral.emoji;
    }
  }
}
