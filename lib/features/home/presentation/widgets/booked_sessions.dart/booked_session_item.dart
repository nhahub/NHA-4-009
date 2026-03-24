import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/string_extensions.dart';
import 'package:moodly/core/extensions/to_custom_format.dart';
import 'package:moodly/core/theming/app_styles.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionItem extends StatelessWidget {
  const BookedSessionItem({super.key, required this.bookingModel});
  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (bookingModel.sessionType) {
          case "chat":
            context.push(
              Routes.therapistChatView,
              args: bookingModel.therapistId,
            );
            break;
          case "call":
            context.push(Routes.therapistLiveView, args: bookingModel.id);
            break;
          default:
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.bgFill,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
              blurRadius: 4,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    bookingModel.therapistImage.isNullOrEmpty()
                        ? kImagePlaceHolder
                        : bookingModel.therapistImage!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookingModel.therapistName,
                        style: AppStyles.extraBold15,
                      ),
                      const SizedBox(height: 5),

                      Text(
                        bookingModel.therapistSpeciality,
                        style: AppStyles.medium14.copyWith(
                          color: AppColors.bodyGray,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  // bookingModel.slotStartTime.toCustomFormat(),
                  "12:00 PM",
                  style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
                ),
                Text(
                  // bookingModel.slotEndTime.toCustomFormat(),
                  "12:00 PM",
                  style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
