import '../../../../core/theming/app_assets.dart';

class SessionsForYouModel {
  final String image;
  final String name;
  final String speciality;
  final String about;
  final num discount;
  final num livePrice;
  final num chatPrice;
  final RatingModel rating;

  const SessionsForYouModel({
    required this.image,
    required this.name,
    required this.speciality,
    required this.discount,
    required this.livePrice,
    required this.chatPrice,
    required this.rating,
    required this.about,
  });

  /// live price after discount (1 decimal)
  num get livePriceAfterDiscount {
    return num.parse((livePrice * (1 - discount / 100)).toStringAsFixed(1));
  }

  /// chat price after discount (1 decimal)
  num get chatPriceAfterDiscount {
    return num.parse((chatPrice * (1 - discount / 100)).toStringAsFixed(1));
  }
}

class RatingModel {
  final double rating;
  final int ratingCount;

  const RatingModel({required this.rating, required this.ratingCount});
}

/// List of sessions for you
const List<SessionsForYouModel> sessionsForYouData = [
  SessionsForYouModel(
    image: AppAssets.doctor1,
    name: "Dr. Ana Popescu",
    speciality: "Therapy for anxiety",
    discount: 12,
    livePrice: 90,
    chatPrice: 30,
    rating: RatingModel(rating: 3.7, ratingCount: 65),
    about:
        "Specialist in anxiety therapy, helping individuals understand their fears, manage daily stress, and build emotional stability through practical techniques and personalized support plans.",
  ),

  SessionsForYouModel(
    image: AppAssets.doctor2,
    name: "Dr. Ioana Dobre",
    speciality: "Self-esteem therapy",
    discount: 0,
    livePrice: 100,
    chatPrice: 35,
    rating: RatingModel(rating: 2.9, ratingCount: 121),
    about:
        "Focused on self-esteem and personal growth, supporting individuals in building confidence, self-acceptance, and a positive self-image through structured therapeutic approaches.",
  ),

  SessionsForYouModel(
    image: AppAssets.doctor3,
    name: "Andrei Radu",
    speciality:
        "Licensed psychologist. Stress management, burnout and emotional balance.",
    discount: 16,
    livePrice: 85,
    chatPrice: 28,
    rating: RatingModel(rating: 4.5, ratingCount: 95),
    about:
        "Licensed psychologist specialized in stress management, burnout recovery, and emotional balance, helping clients regain clarity, resilience, and a healthier lifestyle.",
  ),
];
