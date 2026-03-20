import 'package:equatable/equatable.dart';
import 'package:moodly/features/home/data/models/mood_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/mood_progress_repo.dart';
part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  final MoodProgressRepo moodProgressRepo;

  MoodCubit({required this.moodProgressRepo}) : super(MoodLoadingState());

  /// Week
  Future<void> fetchWeekMood() async {
    try {
      emit(MoodLoadingState());
      final moodData = await moodProgressRepo.getCurrentWeekMood();
      emit(MoodLoadedSuccessState(moodData: moodData));
    } catch (e) {
      emit(MoodFailureState(message: e.toString()));
    }
  }

  /// Month
  Future<void> fetchMonthMood() async {
    try {
      emit(MoodLoadingState());
      final moodData = await moodProgressRepo.getCurrentMonthMood();
      emit(MoodLoadedSuccessState(moodData: moodData));
    } catch (e) {
      emit(MoodFailureState(message: e.toString()));
    }
  }

  /// Year
  Future<void> fetchYearMood() async {
    try {
      emit(MoodLoadingState());
      final moodData = await moodProgressRepo.getCurrentYearMood();
      emit(MoodLoadedSuccessState(moodData: moodData));
    } catch (e) {
      emit(MoodFailureState(message: e.toString()));
    }
  }
}
