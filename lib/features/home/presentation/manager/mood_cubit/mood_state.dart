part of 'mood_cubit.dart';

sealed class MoodState extends Equatable {
  const MoodState();

  @override
  List<Object?> get props => [];
}

class MoodLoadingState extends MoodState {}

class MoodLoadedSuccessState extends MoodState {
  final List<MoodChart> moodData;

  const MoodLoadedSuccessState({required this.moodData});

  @override
  List<Object?> get props => [moodData];
}

class MoodFailureState extends MoodState {
  final String message;

  const MoodFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
