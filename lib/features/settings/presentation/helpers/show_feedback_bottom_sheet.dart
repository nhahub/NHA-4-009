import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/services/get_it_service.dart';
import 'package:moodly/features/settings/data/repos/app_rating_repo.dart';
import 'package:moodly/features/settings/presentation/widgets/feedback_bottom_sheet.dart';

import '../manager/app_rating_cubit/app_rating_cubit.dart';

void showFeedbackBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => BlocProvider(
      create: (context) =>
          AppRatingCubit(appRatingRepo: getIt.get<AppRatingRepo>())
            ..getUserRating(),
      child: const FeedbackBottomSheet(),
    ),
  );
}
