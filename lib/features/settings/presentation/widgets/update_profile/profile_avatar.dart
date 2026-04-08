import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/models/user_data_model.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/user_avatar.dart';

class ProfileAvatar extends StatelessWidget {
  final UserDataModel? user;
  final File? file;

  const ProfileAvatar({
    super.key,
    required this.user,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return file != null
        ? CircleAvatar(
            radius: 45,
            backgroundColor: AppColors.lightGrey,
            backgroundImage: FileImage(file!),
          )
        : UserAvatar(name: user?.name ?? "", imageUrl: user?.picture);
  }
}
