import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/booked_sessions.dart/booked_session_item.dart';
import 'package:moodly/features/therapist/data/models/booking_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookedSessionsListView extends StatelessWidget {
  final List<BookingModel> bookings;
  final bool isLoading;
  const BookedSessionsListView({
    super.key,
    required this.bookings,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: isLoading,
      child: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return BookedSessionItem(bookingModel: bookings[index]);
        },
      ),
    );
  }
}
