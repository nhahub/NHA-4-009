import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/enums/mood_time_range.dart';

class MoodRangeCubit extends Cubit<MoodPeriod> {
  MoodRangeCubit() : super(MoodPeriod.week);

  void changeRange(MoodPeriod range) {
    emit(range);
  }
}
