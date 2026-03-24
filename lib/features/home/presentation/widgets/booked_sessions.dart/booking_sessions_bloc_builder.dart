import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/data/models/dummy/dummy_booked_sessions.dart';
import 'package:moodly/features/home/presentation/manager/get_booking_sessions_cubit/get_booking_sessions_cubit.dart';
import 'package:moodly/features/home/presentation/widgets/booked_sessions.dart/booked_sessions_list_view.dart';

class BookingSessionsBlocBuilder extends StatelessWidget {
  const BookingSessionsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBookingSessionsCubit, GetBookingSessionsState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (GetBookingSessionsLoadingState):
            return BookedSessionsListView(
              bookings: DummyBookedSessions.dummyBookedSessions,
              isLoading: true,
            );

          case const (GetBookingSessionsSuccessState):
            final loadedState = state as GetBookingSessionsSuccessState;
            if (loadedState.bookings.isEmpty) {
              return const Center(child: Text("No Bookings"));
            }
            return BookedSessionsListView(bookings: loadedState.bookings);

          case const (GetBookingSessionsFailureState):
            final errorState = state as GetBookingSessionsFailureState;
            return Center(
              child: Text(
                errorState.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );

          default:
            return const Center(child: Text("Unknown state"));
        }
      },
    );
  }
}
