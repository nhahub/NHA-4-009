import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/settings/data/static_data/terms_data.dart';
import 'package:moodly/features/settings/presentation/widgets/terms_and_conditions/terms_intro.dart';
import 'package:moodly/features/settings/presentation/widgets/terms_and_conditions/terms_section_widget.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Terms & Conditions"),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        itemCount: termsData.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const TermsIntro();
          }
          final section = termsData[index - 1];
          return TermsSectionWidget(section: section);
        },
      ),
    );
  }
}
