import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/recommendation_model.dart';
import '../../../data/repos/recommendation_repo.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final RecommendationRepo _recommendationRepo;

  RecommendationCubit({required RecommendationRepo recommendationRepo})
    : _recommendationRepo = recommendationRepo,
      super(RecommendationLoadingState());

  void getRecommendationData() async {
    final Either<Failure, RecommendationModel> response =
        await _recommendationRepo.getRecommendationData();

    response.fold(
      (failure) {
        emit(RecommendationFailureState(errorMessage: failure.message));
      },
      (recommendationModel) {
        emit(
          RecommendationSuccessLoadedState(
            recommendationModel: recommendationModel,
          ),
        );
      },
    );
  }
}
