// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistRatingModel _$TherapistRatingModelFromJson(
  Map<String, dynamic> json,
) => TherapistRatingModel(
  id: json['id'] as String,
  therapistId: json['therapist_id'] as String,
  userId: json['user_id'] as String,
  rating: (json['rating'] as num).toInt(),
  review: json['review'] as String,
  userName: json['userName'] as String?,
  userAvatar: json['userAvatar'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TherapistRatingModelToJson(
  TherapistRatingModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'therapist_id': instance.therapistId,
  'user_id': instance.userId,
  'rating': instance.rating,
  'review': instance.review,
  'userName': instance.userName,
  'userAvatar': instance.userAvatar,
  'created_at': instance.createdAt.toIso8601String(),
};
