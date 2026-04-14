import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/repos/audio_repo.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioRepo _audioRepo;

  AudioCubit({required AudioRepo audioRepo})
    : _audioRepo = audioRepo,
      super(AudioLoadingState());

  Future<void> getAudioTracks() async {
    try {
      final List<AudioModel> tracks = await _audioRepo.getAudioTracks();
      emit(AudioLoadedSuccessState(tracks: tracks));
    } catch (e) {
      emit(
        AudioFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}
