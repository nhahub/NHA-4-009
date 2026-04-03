import 'package:flutter/material.dart';
import '../../../../../core/theming/app_styles.dart';

class BodyText extends StatelessWidget {
  final String text;
  const BodyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.regular13.copyWith(color: Colors.black54),
    );
  }
}
