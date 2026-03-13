import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/add_therapist_rating_button.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/no_reviews_widget.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/therapist_ratings_view_body.dart';
import '../../data/models/dummy/dummy_therapist_ratings.dart';
import '../manager/therapist_rating_cubit/therapist_rating_cubit.dart';

class TherapistRatingsView extends StatelessWidget {
  final String therapistId;
  const TherapistRatingsView({super.key, required this.therapistId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TherapistRatingCubit, TherapistRatingState>(
      builder: (context, state) {
        bool hasUserRated = false;
        if (state is GetTherapistRatingsLoadedState) {
          final userId = getUser()!.userId;
          hasUserRated = state.ratings.any((r) => r.userId == userId);
        }

        return Scaffold(
          floatingActionButton: !hasUserRated
              ? AddTherapistRatingButton(therapistId: therapistId)
              : null,
          appBar: const BackButtonAppbar(title: "Ratings & Reviews"),
          body: switch (state) {
            AddTherapistRatingsLoadingState() => TherapistRatingsViewBody(
              ratings: DummyTherapistRatings.dummyRatings,
              isLoading: true,
              avg: 0,
              count: 0,
            ),
            AddTherapistRatingsFailureState() => Center(
              child: Text(state.error),
            ),
            GetTherapistRatingsLoadedState() =>
              state.ratings.isEmpty
                  ? const NoReviewsWidget()
                  : TherapistRatingsViewBody(
                      ratings: state.ratings,
                      avg: state.average ?? 0.0,
                      count: state.totalCount ?? state.ratings.length,
                    ),
            _ => const SizedBox.shrink(),
          },
        );
      },
    );
  }
}
