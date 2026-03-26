// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioModel _$AudioModelFromJson(Map<String, dynamic> json) => AudioModel(
  audioUrl: json['audio_url'] as String,
  coverUrl: json['cover_url'] as String,
  category: json['category'] as String,
  title: json['title'] as String,
  duration: (json['duration'] as num).toDouble(),
  id: json['id'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$AudioModelToJson(AudioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'cover_url': instance.coverUrl,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'audio_url': instance.audioUrl,
    };
