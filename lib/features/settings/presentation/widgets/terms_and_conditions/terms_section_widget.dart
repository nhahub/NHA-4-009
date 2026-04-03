import 'package:flutter/material.dart';
import 'package:moodly/features/settings/data/models/terms_section.dart';
import 'package:moodly/features/settings/presentation/widgets/shared/body_text.dart';
import 'package:moodly/features/settings/presentation/widgets/shared/bullet_text.dart';
import 'package:moodly/features/settings/presentation/widgets/shared/section_title.dart';

class TermsSectionWidget extends StatelessWidget {
  final TermsSection section;

  const TermsSectionWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(text: section.title),
        const SizedBox(height: 10),

        ...section.paragraphs.map(
          (text) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: BodyText(text: text),
          ),
        ),

        if (section.bullets != null) ...[
          const SizedBox(height: 6),
          ...section.bullets!.map((b) => BulletText(text: b)),
        ],

        const SizedBox(height: 8),
      ],
    );
  }
}
