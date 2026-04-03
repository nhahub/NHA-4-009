import 'package:flutter/material.dart';

import '../../../data/models/legal_data_model.dart';
import 'body_text.dart';
import 'bullet_text.dart';
import 'section_title.dart';

class LegalSectionWidget extends StatelessWidget {
  final LegalDataModel section;

  const LegalSectionWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.title != null) ...[
          SectionTitle(text: section.title!),
          const SizedBox(height: 10),
        ],

        if (section.paragraphs != null) ...[
          ...section.paragraphs!.map(
            (text) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: BodyText(text: text),
            ),
          ),
        ],

        if (section.bullets != null) ...[
          const SizedBox(height: 6),
          ...section.bullets!.map((b) => BulletText(text: b)),
        ],

        const SizedBox(height: 8),
      ],
    );
  }
}
