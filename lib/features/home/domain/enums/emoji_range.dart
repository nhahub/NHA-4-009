import '../../../../core/theming/app_assets.dart';

enum EmojiRange { veryBad, bad, neutral, good, veryGood }

extension EmojiRangeExtension on EmojiRange {
  String get emoji {
    switch (this) {
      case EmojiRange.veryBad:
        return AppAssets.angry;
      case EmojiRange.bad:
        return AppAssets.anxious;
      case EmojiRange.neutral:
        return AppAssets.neutral;
      case EmojiRange.good:
        return AppAssets.calm;
      case EmojiRange.veryGood:
        return AppAssets.happy;
    }
  }
}
