import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/video_model.dart';
import '../../manager/video_player_cubit/video_player_cubit.dart';
import 'audio_progress_bar.dart';
import 'main_controls.dart';
import 'secondary_controls.dart';
import 'session_header.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key, required this.videoModel});

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        final cubit = context.read<VideoPlayerCubit>();

        return Column(
          children: [
            SessionHeader(
              videoModel: videoModel,
              isPlaying: state.isPlaying,
              onImageTap: cubit.togglePlayPause,
              videoPlayerWidget:
                  state.isInitialized && cubit.chewieController != null
                  ? Chewie(controller: cubit.chewieController!)
                  : null,
            ),
            const SizedBox(height: 18),
            AudioProgressBar(
              elapsedSeconds: state.position,
              totalSeconds: state.isInitialized
                  ? state.duration
                  : videoModel.duration.toInt() * 60,
              onSeek: (value) => cubit.seek(seconds: value),
            ),
            const SizedBox(height: 20),
            MainControls(
              isPlaying: state.isPlaying,
              onPlayPause: cubit.togglePlayPause,
              onSkipForward: cubit.skipForward,
              onSkipBackward: cubit.skipBackward,
            ),
            const SizedBox(height: 20),
            SecondaryControls(
              isMuted: state.isMuted,
              onVolumeToggle: cubit.toggleVolume,
              onFullscreenToggle: cubit.toggleFullscreen,
              onSpeedChanged: (value) => cubit.changeSpeed(speed: value),
            ),
          ],
        );
      },
    );
  }
}
