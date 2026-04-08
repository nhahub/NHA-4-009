import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppStyles.bold14);
  }
}
