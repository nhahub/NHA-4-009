import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/repos/audio_repo.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioRepo audioRepo;

  AudioCubit({required this.audioRepo}) : super(AudioLoadingState());

  Future<void> getAudioTracks() async {
    final Either<Failure, List<AudioModel>> result = await audioRepo
        .getAudioTracks();
    result.fold(
      (failure) {
        emit(AudioFailureState(message: failure.message));
      },
      (tracks) {
        emit(AudioLoadedSuccessState(tracks: tracks));
      },
    );
  }
}
