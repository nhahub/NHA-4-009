enum MoodPeriod { week, month, year }

extension MoodPeriodExtension on MoodPeriod {
  String get title {
    switch (this) {
      case MoodPeriod.week:
        return "Weekly";
      case MoodPeriod.month:
        return "Monthly";
      case MoodPeriod.year:
        return "Yearly";
    }
  }
}
