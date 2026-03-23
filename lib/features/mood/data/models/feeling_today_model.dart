import '../../../../core/theming/app_assets.dart';

class FeelingTodayModel {
  final String feeling;
  final String icon;

  const FeelingTodayModel({required this.feeling, required this.icon});
}

const List<FeelingTodayModel> feelingTodayData = [
  FeelingTodayModel(feeling: "Angry", icon: AppAssets.angry),
  FeelingTodayModel(feeling: "Anxious", icon: AppAssets.anxious),
  FeelingTodayModel(feeling: "Neutral", icon: AppAssets.neutral),
  FeelingTodayModel(feeling: "Calm", icon: AppAssets.calm),
  FeelingTodayModel(feeling: "Happy", icon: AppAssets.happy),
];
