import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/main_card.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/rotated_gradient_card.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/rotated_inner_shadow_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/quote/quote_model.dart';

class QuoteShape extends StatelessWidget {
  final QuoteModel dailyQuote;
  final bool isLoading;
  const QuoteShape({
    super.key,
    required this.dailyQuote,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: isLoading,
      child: Stack(
        children: [
          RotatedGradientCard(dailyQuote: dailyQuote),
          RotatedInnerShadowCard(dailyQuote: dailyQuote),
          MainCard(dailyQuote: dailyQuote),
        ],
      ),
    );
  }
}
