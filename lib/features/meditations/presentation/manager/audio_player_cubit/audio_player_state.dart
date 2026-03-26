part of 'audio_player_cubit.dart';

sealed class AudioPlayerState extends Equatable {
  const AudioPlayerState();

  @override
  List<Object?> get props => [];
}

class AudioPlayerLoadingState extends AudioPlayerState {}

class AudioPlayerInitState extends AudioPlayerState {
  final AudioPlayerService audioService;
  final AudioModel audioModel;
  const AudioPlayerInitState({
    required this.audioService,
    required this.audioModel,
  });

  @override
  List<Object?> get props => [audioService, audioModel];
}

class AudioPlayerFailureState extends AudioPlayerState {
  final String message;
  const AudioPlayerFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
