import 'package:flutter/material.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(bottom: false, child: CustomScrollView(slivers: [
          ],
        )),
    );
  }
}
