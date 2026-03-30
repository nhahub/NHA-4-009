import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/functions/confirm_dialog.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/widgets/app_text_button.dart';
import 'package:moodly/core/widgets/app_text_form_field.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_details/custom_rating.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../manager/app_rating_cubit/app_rating_cubit.dart';

class FeedbackBottomSheet extends StatefulWidget {
  const FeedbackBottomSheet({super.key});

  @override
  State<FeedbackBottomSheet> createState() => _FeedbackBottomSheetState();
}

class _FeedbackBottomSheetState extends State<FeedbackBottomSheet> {
  final TextEditingController feedbackController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kAppHorizontalPadding,
          vertical: kAppVerticalPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "How was your experience?",
              style: AppStyles.extraBold17,
            ),
            const SizedBox(height: 16),
            BlocBuilder<AppRatingCubit, AppRatingState>(
              buildWhen: (previous, current) =>
                  current is GetAppRatingSuccessState,
              builder: (context, state) {
                int initialRating = 0;

                if (state is GetAppRatingSuccessState) {
                  initialRating = state.appRatingModel?.rating ?? 0;
                }

                return CustomRating(
                  isEditable: true,
                  itemSize: 32,
                  userRating: initialRating.toDouble(),
                  onRatingUpdate: (value) {
                    context.read<AppRatingCubit>().changeRating(
                      newRating: value.toInt(),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            BlocListener<AppRatingCubit, AppRatingState>(
              listenWhen: (previous, current) =>
                  current is GetAppRatingSuccessState,
              listener: (context, state) {
                if (state is GetAppRatingSuccessState) {
                  feedbackController.text =
                      state.appRatingModel?.feedback ?? '';
                }
              },
              child: AppTextFormField(
                hintText: "Write your feedback...",
                maxLines: 4,
                controller: feedbackController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your feedback";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<AppRatingCubit, AppRatingState>(
              builder: (context, state) {
                if (state is AppRatingValidationErrorState &&
                    state.showRatingError) {
                  return Text(
                    "Please enter your rating",
                    style: AppStyles.regular14.copyWith(
                      color: AppColors.lighterRed,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<AppRatingCubit, AppRatingState>(
              listener: (context, state) {
                if (state is AppRatingSubmittedState) {
                  confirmDialog(
                    context: context,
                    title: "Thank you",
                    message: "Your feedback has been submitted",
                    onConfirm: () {
                      context.pop();
                      context.pop();
                    },
                  );
                } else if (state is AppRatingFailureState) {
                  errorDialog(context: context, message: state.message);
                }
              },
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: state is AppRatingLoadingState,
                  child: SizedBox(
                    width: double.infinity,
                    child: AppTextButton(
                      onPressed: () {
                        validateThenSubmitFeedback(context: context);
                      },
                      buttonText: "Submit",
                      child: state is AppRatingLoadingState
                          ? const CustomCircularProgressIndicator()
                          : null,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  return context.pop();
                },
                child: Text(
                  "Maybe later",
                  style: AppStyles.regular14.copyWith(
                    color: AppColors.linkGray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateThenSubmitFeedback({required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      context.read<AppRatingCubit>().validateAndSubmit(
        feedback: feedbackController.text.trim(),
      );
    }
  }
}
