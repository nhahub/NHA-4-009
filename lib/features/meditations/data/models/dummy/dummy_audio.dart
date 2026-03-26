import 'package:moodly/features/meditations/data/models/audio_model.dart';
import '../../../../../core/theming/app_assets.dart';

class DummyTracks {
  static List<AudioModel> dummyTracks = List.generate(
    5,
    (index) => AudioModel(
      id: "audio_$index",
      title: "Relaxing Sound $index",
      coverUrl: AppAssets.dummyImage,
      audioUrl: "",
      duration: 180 + index * 15,
      category: "Meditation",
      createdAt: "",
    ),
  );
}
