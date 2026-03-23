import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../widgets/subscribe/subscribe_view_body.dart';

class SubscribeView extends StatelessWidget {
  const SubscribeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF9F9F9),
      appBar: BackButtonAppbar(
        title: "Payment",
        endIcon: Icons.qr_code_scanner,
        onEndTap: () {},
      ),
      body: const SubscribeViewBody(),
    );
  }
}
