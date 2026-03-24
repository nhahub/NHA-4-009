import 'package:flutter/material.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/booking_session_button.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/date_selector_widget.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/select_session_type_widget.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/session_price.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/time_slots_widget.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/therapist_model.dart';

class BookingSessionView extends StatelessWidget {
  final TherapistModel therapist;
  const BookingSessionView({super.key, required this.therapist});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Booking Session"),
      body: Column(
        children: [
          SelectSessionTypeWidget(),
          SizedBox(height: 20),
          DateSelectorWidget(),
          TimeSlotsWidget(),
          SizedBox(height: 20),
          SessionPrice(),
          SizedBox(height: 20),
          BookingSessionButton(),
        ],
      ),
    );
  }
}
