import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/audio_error.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/services/audio_player_service.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayerService _audioPlayerService;
  final AudioModel _audioModel;

  AudioPlayerCubit({
    required AudioPlayerService audioPlayerService,
    required AudioModel audioModel,
  }) : _audioModel = audioModel,
       _audioPlayerService = audioPlayerService,
       super(AudioPlayerLoadingState());

  Future<void> initAudio({required String audioUrl}) async {
    try {
      await _audioPlayerService.init(audioUrl);
      emit(
        AudioPlayerInitState(
          audioService: _audioPlayerService,
          audioModel: _audioModel,
        ),
      );
    } on AudioLoadException catch (e) {
      emit(AudioPlayerFailureState(message: e.message));
    } on AudioSessionException catch (e) {
      emit(AudioPlayerFailureState(message: e.message));
    } catch (_) {
      emit(const AudioPlayerFailureState(message: "Unexpected error occurred"));
    }
  }

  @override
  Future<void> close() {
    _audioPlayerService.dispose();
    return super.close();
  }
}
