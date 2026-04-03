import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class BulletText extends StatelessWidget {
  final String text;
  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•  ",
            style: AppStyles.regular13.copyWith(color: Colors.black54),
          ),
          Expanded(
            child: Text(
              text,
              style: AppStyles.regular13.copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
