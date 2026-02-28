import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../home/data/models/sessions_for_you_model.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../widgets/therapist_about_section.dart';
import '../widgets/therapist_contact_section.dart';
import '../widgets/therapist_header.dart';
import '../widgets/therapist_image.dart';
import '../widgets/therapist_rating_section.dart';

class TherapistDetailsView extends StatelessWidget {
  final SessionsForYouModel sessionsForYouModel;

  const TherapistDetailsView({super.key, required this.sessionsForYouModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Therapist Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TherapistImage(image: sessionsForYouModel.image),
            const SizedBox(height: 20),
            TherapistHeader(
              name: sessionsForYouModel.name,
              speciality: sessionsForYouModel.speciality,
            ),
            const SizedBox(height: 4),
            TherapistRatingSection(
              rating: sessionsForYouModel.rating.rating,
              ratingCount: sessionsForYouModel.rating.ratingCount,
            ),
            const Divider(color: AppColors.lightGrey, height: 30),
            TherapistAboutSection(about: sessionsForYouModel.about),
            const SizedBox(height: 16),
            const TherapistContactSection(),
          ],
        ),
      ),
    );
  }
}
