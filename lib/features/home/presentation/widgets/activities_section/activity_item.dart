import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/activity/activity_model.dart';
import 'activity_timer.dart';

class ActivityItem extends StatelessWidget {
  final ActivityModel activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          CachedNetworkImage(
            imageUrl: activity.imageUrl,
            fadeInDuration: const Duration(milliseconds: 200),
            placeholder: (context, url) => Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),

            errorWidget: (context, url, error) => Container(
              color: Colors.grey,
              child: const Icon(Icons.broken_image),
            ),

            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Text(
            activity.title,
            style: AppStyles.extraBold27.copyWith(color: AppColors.brandGreen),
          ),
          const SizedBox(height: 15),
          Text(
            activity.description,
            style: AppStyles.medium20,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ActivityTimer(minutes: activity.duration),
        ],
      ),
    );
  }
}
