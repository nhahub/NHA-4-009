// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegalDataModel _$LegalDataModelFromJson(Map<String, dynamic> json) =>
    LegalDataModel(
      title: json['title'] as String?,
      paragraphs: (json['paragraphs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bullets: (json['bullets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LegalDataModelToJson(LegalDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'paragraphs': instance.paragraphs,
      'bullets': instance.bullets,
    };
