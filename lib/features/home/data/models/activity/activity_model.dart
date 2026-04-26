import 'package:json_annotation/json_annotation.dart';
part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel {
  final String id;
  final String title;
  final String description;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  final int duration;

  @JsonKey(name: 'category_id')
  final String categoryId;

  const ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.categoryId,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ActivityModelToJson(this);
}