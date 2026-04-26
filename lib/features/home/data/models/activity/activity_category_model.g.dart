// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityCategoryModel _$ActivityCategoryModelFromJson(
  Map<String, dynamic> json,
) => ActivityCategoryModel(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$ActivityCategoryModelToJson(
  ActivityCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image_url': instance.imageUrl,
};
