// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
  title: json['title'] as String,
  category: json['category'] as String,
  coverUrl: json['cover_url'] as String,
  duration: (json['duration'] as num).toDouble(),
  id: json['id'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'cover_url': instance.coverUrl,
      'duration': instance.duration,
      'created_at': instance.createdAt,
    };
