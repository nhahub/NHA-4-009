import 'package:flutter/material.dart';
import 'package:moodly/features/settings/presentation/widgets/shared/body_text.dart';
import 'package:moodly/features/settings/presentation/widgets/shared/title_text.dart';

class TermsIntro extends StatelessWidget {
  const TermsIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),

        TitleText(text: "Effective Date: May 20, 2026"),

        SizedBox(height: 10),

        BodyText(
          text:
              'These Terms of Service ("Terms") govern your access to and use of the Modily mobile application (the "App"). By downloading, accessing, or using the App, you agree to be bound by these Terms.',
        ),

        SizedBox(height: 10),
      ],
    );
  }
}
