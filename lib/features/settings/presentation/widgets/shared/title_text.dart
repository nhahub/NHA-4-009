import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_styles.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppStyles.bold14);
  }
}
