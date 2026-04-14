import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/networking/api_error_handler.dart';

import '../../../data/models/therapist_review_model.dart';
import '../../../data/repos/therapist_reviews_repo.dart';
import '../../../domain/functions/create_review_model.dart';
import '../../../domain/functions/review_utils.dart';

part 'therapist_reviews_state.dart';

class TherapistReviewsCubit extends Cubit<TherapistReviewsState> {
  final TherapistReviewsRepo _therapistRatingRepo;

  TherapistReviewsCubit({required TherapistReviewsRepo therapistRatingRepo})
    : _therapistRatingRepo = therapistRatingRepo,
      super(AddTherapistReviewLoadingState());

  Future<void> getReviews({required String therapistId}) async {
    emit(GetTherapistReviewsLoadingState());

    try {
      final List<TherapistReviewModel> reviews = await _therapistRatingRepo
          .getReviews(therapistId: therapistId);
      emit(
        GetTherapistReviewsSuccessState(
          therapistReviewModel: reviews,
          average: calculateAverageRating(reviews),
          totalCount: reviews.length,
          userRating: 0,
          hasUserRated: hasUserRated(reviews),
        ),
      );
    } catch (e) {
      emit(
        GetTherapistReviewsFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> addReview({
    required String therapistId,
    required String review,
    bool displayAnonymously = false,
  }) async {
    if (state is! GetTherapistReviewsSuccessState) return;
    final currentState = state as GetTherapistReviewsSuccessState;

    emit(AddTherapistReviewLoadingState());

    try {
      final TherapistReviewModel newReview = createTherapistReview(
        therapistId: therapistId,
        reviewText: review,
        rating: currentState.userRating.toInt(),
        displayAnonymously: displayAnonymously,
      );

      await _therapistRatingRepo.addReview(rating: newReview);
      await getReviews(therapistId: therapistId);
      emit(AddTherapistReviewSuccessState());
    } catch (e) {
      emit(
        AddTherapistReviewFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> updateReview({
    required TherapistReviewModel reviewModel,
    required String review,
    bool displayAnonymously = false,
  }) async {
    if (state is! GetTherapistReviewsSuccessState) return;
    final currentState = state as GetTherapistReviewsSuccessState;

    emit(UpdateTherapistReviewLoadingState());

    try {
      final TherapistReviewModel updatedReview = createTherapistReview(
        id: reviewModel.id,
        therapistId: reviewModel.therapistId,
        reviewText: review,
        rating: currentState.userRating.toInt(),
        displayAnonymously: displayAnonymously,
        createdAt: DateTime.now(),
      );

      await _therapistRatingRepo.updateReview(
        therapistReviewModel: updatedReview,
      );

      await getReviews(therapistId: reviewModel.therapistId);
      emit(UpdateTherapistReviewSuccessState());
    } catch (e) {
      emit(
        UpdateTherapistReviewFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> deleteReview({
    required String ratingId,
    required String therapistId,
  }) async {
    if (state is! GetTherapistReviewsSuccessState) return;

    emit(DeleteTherapistReviewLoadingState());
    try {
      await _therapistRatingRepo.deleteReview(ratingId: ratingId);
      await getReviews(therapistId: therapistId);
      emit(DeleteTherapistReviewSuccessState());
    } catch (e) {
      emit(
        DeleteTherapistReviewFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  void updateUserRating({required num rating}) {
    if (state is GetTherapistReviewsSuccessState) {
      final currentState = state as GetTherapistReviewsSuccessState;
      emit(currentState.copyWith(userRating: rating));
    }
  }
}
