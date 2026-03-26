import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/audio_model.dart';

class AudioInfo extends StatelessWidget {
  final AudioModel audioModel;
  const AudioInfo({super.key, required this.audioModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: NetworkImage(audioModel.coverUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Song Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                audioModel.title,
                softWrap: true,
                style: AppStyles.extraBold17,
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                // Handle favorite icon tap
              },
              child: SvgPicture.asset(
                AppAssets.heartIcon,
                height: 24,
                width: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
