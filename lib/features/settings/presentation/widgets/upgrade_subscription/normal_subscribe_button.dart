import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_text_button.dart';

class NormalSubscribeButton extends StatelessWidget {
  const NormalSubscribeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppTextButton(
        onPressed: () {
          context.pushReplacement(Routes.premiumView, args: true);
        },
        buttonText: "Subscribe Now",
      ),
    );
  }
}
