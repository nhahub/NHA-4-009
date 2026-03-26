part of 'audio_cubit.dart';

sealed class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object?> get props => [];
}

class AudioLoadingState extends AudioState {}

class AudioLoadedSuccessState extends AudioState {
  final List<AudioModel> tracks;

  const AudioLoadedSuccessState({required this.tracks});

  @override
  List<Object?> get props => [tracks];
}

class AudioFailureState extends AudioState {
  final String message;
  const AudioFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
