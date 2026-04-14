import '../models/therapist_review_model.dart';
import '../services/therapist_reviews_service.dart';

class TherapistReviewsRepo {
  final TherapistReviewsService _therapistReviewsService;

  TherapistReviewsRepo({
    required TherapistReviewsService therapistReviewsService,
  }) : _therapistReviewsService = therapistReviewsService;

  Future<List<TherapistReviewModel>> getReviews({
    required String therapistId,
  }) async {
    final List<Map<String, dynamic>> data = await _therapistReviewsService
        .getReviews(therapistId: therapistId);

    final List<TherapistReviewModel> ratings = data
        .map((e) => TherapistReviewModel.fromJson(e))
        .toList();

    return ratings;
  }

  Future<void> addReview({required TherapistReviewModel rating}) async {
    await _therapistReviewsService.addReview(data: rating.toJson());
  }

  Future<void> updateReview({
    required TherapistReviewModel therapistReviewModel,
  }) async {
    await _therapistReviewsService.updateReview(
      ratingId: therapistReviewModel.id,
      updatedData: therapistReviewModel.toJson(),
    );
  }

  Future<void> deleteReview({required String ratingId}) async {
    await _therapistReviewsService.deleteReview(ratingId: ratingId);
  }
}
