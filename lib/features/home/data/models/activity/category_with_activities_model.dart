import 'package:json_annotation/json_annotation.dart';
import 'activity_model.dart';
import 'activity_category_model.dart';

@JsonSerializable(explicitToJson: true)
class CategoryWithActivitiesModel {
  final ActivityCategoryModel category;
  final List<ActivityModel> activities;

  const CategoryWithActivitiesModel({
    required this.category,
    required this.activities,
  });

  factory CategoryWithActivitiesModel.fromJson(Map<String, dynamic> json) {
    return CategoryWithActivitiesModel(
      category: ActivityCategoryModel.fromJson(json),
      activities: (json['activities'] as List)
          .map((e) => ActivityModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    ...category.toJson(),
    'activities': activities.map((e) => e.toJson()).toList(),
  };
}
