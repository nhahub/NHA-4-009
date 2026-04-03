import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../data/models/legal_data_model.dart';
import 'legal_section_widget.dart';

class LegalListView extends StatelessWidget {
  final bool isLoading;
  final List<LegalDataModel> data;

  const LegalListView({super.key, required this.data, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: isLoading,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: kAppHorizontalPadding,
          right: kAppHorizontalPadding,
          bottom: 20,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return LegalSectionWidget(section: data[index]);
        },
      ),
    );
  }
}
