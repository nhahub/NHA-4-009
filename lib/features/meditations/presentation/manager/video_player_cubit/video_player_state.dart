part of 'video_player_cubit.dart';

class VideoPlayerState {
  final bool isInitialized;
  final bool isPlaying;
  final int position;
  final int duration;
  final bool isMuted;
  final double speed;
  final String? error;

  const VideoPlayerState({
    this.isInitialized = false,
    this.isPlaying = false,
    this.position = 0,
    this.duration = 0,
    this.isMuted = false,
    this.speed = 1.0,
    this.error,
  });

  VideoPlayerState copyWith({
    bool? isInitialized,
    bool? isPlaying,
    int? position,
    int? duration,
    bool? isMuted,
    double? speed,
    String? error,
  }) {
    return VideoPlayerState(
      isInitialized: isInitialized ?? this.isInitialized,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isMuted: isMuted ?? this.isMuted,
      speed: speed ?? this.speed,
      error: error ?? this.error,
    );
  }
}
