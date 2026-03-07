import 'package:json_annotation/json_annotation.dart';

part 'therapist_rating_model.g.dart';

@JsonSerializable()
class TherapistRatingModel {
  final String id;

  @JsonKey(name: 'therapist_id')
  final String therapistId;

  @JsonKey(name: 'user_id')
  final String userId;

  final int rating;
  final String review;

  final String? userName;
  final String? userAvatar;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  TherapistRatingModel({
    required this.id,
    required this.therapistId,
    required this.userId,
    required this.rating,
    required this.review,
    this.userName,
    this.userAvatar,
    required this.createdAt,
  });

  factory TherapistRatingModel.fromJson(Map<String, dynamic> json) =>
      _$TherapistRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistRatingModelToJson(this);
}