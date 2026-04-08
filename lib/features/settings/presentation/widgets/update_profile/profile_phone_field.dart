import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/update_profile_cubit/update_profile_cubit.dart';
import 'phone_field.dart';

class ProfilePhoneField extends StatelessWidget {
  const ProfilePhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 10),
          child: Text(
            "Phone",
            style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
          ),
        ),
        PhoneField(
          onInputChanged: (phone) {
            context.read<UpdateProfileCubit>().updatePhoneNumber(phone);
          },
        ),
      ],
    );
  }
}
