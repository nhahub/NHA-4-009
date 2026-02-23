enum MoodType { angry, anxious, neutral, calm, happy }

String moodTypeToString(MoodType mood) {
  switch (mood) {
    case MoodType.angry:
      return 'Angry';
    case MoodType.anxious:
      return 'Anxious';
    case MoodType.neutral:
      return 'Neutral';
    case MoodType.calm:
      return 'Calm';
    case MoodType.happy:
      return 'happy';
  }
}

MoodType moodTypeFromString(String value) {
  switch (value) {
    case 'Angry':
      return MoodType.angry;
    case 'Anxious':
      return MoodType.anxious;
    case 'Neutral':
      return MoodType.neutral;
    case 'Calm':
      return MoodType.calm;
    case 'Happy':
      return MoodType.happy;
    default:
      throw Exception('Unknown mood type: $value');
  }
}
