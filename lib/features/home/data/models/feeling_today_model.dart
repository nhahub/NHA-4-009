import '../../../../core/theming/app_assets.dart';

class FeelingTodayModel {
  final String feeling;
  final String icon;

  const FeelingTodayModel({required this.feeling, required this.icon});
}

List<FeelingTodayModel> feelingTodayData = [
  const FeelingTodayModel(feeling: "Angry", icon: AppAssets.angry),
  const FeelingTodayModel(feeling: "Anxious", icon: AppAssets.anxious),
  const FeelingTodayModel(feeling: "Neutral", icon: AppAssets.neutral),
  const FeelingTodayModel(feeling: "Calm", icon: AppAssets.calm),
  const FeelingTodayModel(feeling: "Happy", icon: AppAssets.happy),
];
