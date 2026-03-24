import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingModel {
  final String id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'session_type')
  final String sessionType;

  final double? price;

  final String? status;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'therapist_id')
  final String therapistId;

  @JsonKey(name: 'therapist_name')
  final String therapistName;

  @JsonKey(name: 'therapist_speciality')
  final String therapistSpeciality;

  @JsonKey(name: 'therapist_image')
  final String? therapistImage;

  @JsonKey(name: 'slot_id')
  final String slotId;

  @JsonKey(name: 'slot_start_time')
  final DateTime slotStartTime;

  @JsonKey(name: 'slot_end_time')
  final DateTime slotEndTime;

  BookingModel({
    required this.id,
    required this.userId,
    required this.sessionType,
    this.price,
    this.status,
    this.createdAt,
    required this.therapistId,
    required this.therapistName,
    required this.therapistSpeciality,
    required this.therapistImage,
    required this.slotId,
    required this.slotStartTime,
    required this.slotEndTime,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BookingTherapist {
  @JsonKey(name: 'therapist_id')
  final String id;

  @JsonKey(name: 'therapist_name')
  final String name;

  @JsonKey(name: 'therapist_speciality')
  final String speciality;

  @JsonKey(name: 'therapist_image')
  final String? image;

  BookingTherapist({
    required this.id,
    required this.name,
    required this.speciality,
    this.image,
  });

  factory BookingTherapist.fromJson(Map<String, dynamic> json) =>
      _$BookingTherapistFromJson(json);

  Map<String, dynamic> toJson() => _$BookingTherapistToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BookingSlot {
  @JsonKey(name: 'slot_id')
  final String id;

  @JsonKey(name: 'slot_start_time')
  final DateTime startTime;

  @JsonKey(name: 'slot_end_time')
  final DateTime endTime;

  BookingSlot({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  factory BookingSlot.fromJson(Map<String, dynamic> json) =>
      _$BookingSlotFromJson(json);

  Map<String, dynamic> toJson() => _$BookingSlotToJson(this);
}
