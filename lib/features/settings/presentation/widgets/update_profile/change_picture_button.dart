import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/update_profile_cubit/update_profile_cubit.dart';

class ChangePictureButton extends StatelessWidget {
  const ChangePictureButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<UpdateProfileCubit>().pickProfileImageFromGallery();
      },
      child: Text(
        "Change Picture",
        style: AppStyles.regular14.copyWith(color: AppColors.linkGray),
      ),
    );
  }
}
