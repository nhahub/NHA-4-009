import 'package:flutter/material.dart';
import '../../../../core/functions/get_user.dart';
import '../../../../core/widgets/user_avatar.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BackButtonAppbar(title: "Edit Profile"),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ UserAvatar(name: getUser()?.name??""),
          const Text("Edit Profile View"),
        ],
      ),
    );
  }
}
