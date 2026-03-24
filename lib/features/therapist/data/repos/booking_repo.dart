import 'package:dartz/dartz.dart';
import 'package:moodly/core/errors/failure.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/features/therapist/data/models/booking_model.dart';
import 'package:moodly/features/therapist/data/services/booking_service.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/helpers/logger.dart';

class BookingRepo {
  final BookingService bookingService;

  BookingRepo({required this.bookingService});

  Future<Either<Failure, void>> bookingSession({
    required BookingTherapist therapist,
    required BookingSlot slot,
    required String sessionType,
    required double price,
  }) async {
    try {
      const uuid = Uuid();
      await bookingService.bookingSession(
        bookingModel: BookingModel(
          id: uuid.v4(),
          userId: getUser()!.userId,
          sessionType: sessionType,
          price: price,
          status: 'confirmed',
          createdAt: DateTime.now(),
          therapistId: therapist.id,
          therapistName: therapist.name,
          therapistSpeciality: therapist.speciality,
          therapistImage: therapist.image,
          slotId: slot.id,
          slotStartTime: slot.startTime,
          slotEndTime: slot.endTime,
        ),
        slotId: slot.id,
      );

      return right(null);
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, List<BookingModel>>> getBookingSessions() async {
    try {
      final List<BookingModel> bookings = await bookingService
          .getBookingSessions();

      return right(bookings);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> cancelSession({
    required String bookingId,
    required String slotId,
  }) async {
    try {
      await bookingService.cancelSession(bookingId: bookingId, slotId: slotId);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
