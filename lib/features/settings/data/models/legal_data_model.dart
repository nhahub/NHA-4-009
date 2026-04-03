import 'package:json_annotation/json_annotation.dart';

part 'legal_data_model.g.dart';

@JsonSerializable()
class LegalDataModel {
  final String? title;
  final List<String>? paragraphs;
  final List<String>? bullets;

  LegalDataModel({
    this.title,
    this.paragraphs,
    this.bullets,
  });

  factory LegalDataModel.fromJson(Map<String, dynamic> json) =>
      _$LegalDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LegalDataModelToJson(this);
}