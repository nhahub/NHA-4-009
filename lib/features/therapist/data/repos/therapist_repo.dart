import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/therapist_model.dart';
import '../services/therapist_service.dart';

class TherapistRepo {
  final TherapistService _therapistService;

  TherapistRepo({required TherapistService therapistService})
    : _therapistService = therapistService;

  Future<Either<Failure, List<TherapistModel>>> getTherapists() async {
    try {
      final List<TherapistModel> therapists = await _therapistService
          .getTherapists();

      return right(therapists);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
