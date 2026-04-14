import '../models/audio_model.dart';
import '../services/audio_service.dart';

class AudioRepo {
  final AudioService _audioService;
  AudioRepo({required AudioService audioService})
    : _audioService = audioService;

  Future<List<AudioModel>> getAudioTracks() async {
    final List<AudioModel> tracks = await _audioService.getAudioTracks();
    return tracks;
  }
}
