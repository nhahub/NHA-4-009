import 'package:flutter/material.dart';
import 'package:moodly/core/services/get_it_service.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:moodly/features/home/presentation/manager/mood_cubit/mood_cubit.dart';
import 'custom_mood_progress_graph.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/mood_progress_repo.dart';

class WeeklyMoodGraph extends StatelessWidget {
  const WeeklyMoodGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MoodCubit(moodProgressRepo: getIt.get<MoodProgressRepo>())
            ..fetchWeekMood(),
      child: BlocBuilder<MoodCubit, MoodState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case MoodLoadingState():
              return const SizedBox(
                height: 202,
                child: Center(
                  child: CustomCircularProgressIndicator(
                    color: AppColors.brandGreen,
                  ),
                ),
              );

            case const (MoodFailureState):
              final message = (state as MoodFailureState).message;
              return SizedBox(
                height: 202,
                child: Center(child: Text('Error: $message')),
              );

            case const (MoodLoadedSuccessState):
              final moodData = (state as MoodLoadedSuccessState).moodData;
              return CustomMoodProgressGraph(
                moodData: moodData,
                barWidth: 33.39,
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
