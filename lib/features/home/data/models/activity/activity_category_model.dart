import 'package:json_annotation/json_annotation.dart';

part 'activity_category_model.g.dart';

@JsonSerializable()
class ActivityCategoryModel {
  final String id;
  final String name;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  const ActivityCategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory ActivityCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityCategoryModelToJson(this);
}
