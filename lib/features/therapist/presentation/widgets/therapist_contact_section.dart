import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import 'contact_button.dart';

class TherapistContactSection extends StatelessWidget {
  const TherapistContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Contact me", style: AppStyles.extraBold20),
        const SizedBox(height: 4),
        Row(
          children: [
            ContactButton(
              icon: Icons.email,
              onPressed: () {
                context.push(Routes.chatDoctorView);
              },
              color: AppColors.orange,
            ),
            const SizedBox(width: 8),
            ContactButton(
              icon: Icons.call,
              onPressed: () {
                context.push(Routes.liveView);
              },
              color: AppColors.lightGreen,
            ),
          ],
        ),
      ],
    );
  }
}
