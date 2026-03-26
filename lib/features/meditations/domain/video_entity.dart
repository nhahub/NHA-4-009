import '../../../core/models/media_model.dart';

class VideoEntity extends MediaModel {
  final String videoUrl;

  const VideoEntity({
    required this.videoUrl,
    required super.coverUrl,
    required super.category,
    required super.title,
    required super.duration,
    required super.id,
    required super.createdAt,
  });
}
