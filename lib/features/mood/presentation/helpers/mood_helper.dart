import 'package:flutter/material.dart';

import '../../../../core/services/get_it_service.dart';
import '../../data/repos/mood_repo.dart';
import '../widgets/mood_dialog.dart';

void openDailyMoodDialog(BuildContext context) async {
  final MoodRepo moodRepo = getIt.get<MoodRepo>();
  final bool hasSelectedDailyMood = await moodRepo.hasSelectedDailyMood();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!hasSelectedDailyMood) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const MoodDialog(isDailyMood: true);
        },
      );
    }
  });
}

void openAfterSessionMoodDialog(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const MoodDialog(isDailyMood: false);
      },
    );
  });
}
