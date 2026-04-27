import 'package:json_annotation/json_annotation.dart';

part 'media_model.g.dart';
@JsonSerializable()
class MediaModel {
    final String id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'category')
  final String category;

  @JsonKey(name: 'cover_url')
  final String coverUrl;

  @JsonKey(name: 'duration')
  final double duration;

  @JsonKey(name: 'created_at')
  final String createdAt;

  const MediaModel({
    required this.title,
    required this.category,
    required this.coverUrl,
    required this.duration, required this.id, required this.createdAt,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}
