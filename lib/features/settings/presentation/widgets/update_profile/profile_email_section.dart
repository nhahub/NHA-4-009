import 'package:flutter/material.dart';

import '../../../../../core/models/user_data_model.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class ProfileEmailSection extends StatelessWidget {
  final UserDataModel? user;

  const ProfileEmailSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
            ),
            const SizedBox(height: 8),
            Text(user?.email ?? "", style: AppStyles.medium16),
          ],
        ),
      ),
    );
  }
}
