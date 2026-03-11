import 'package:dartz/dartz.dart';
import 'package:moodly/features/therapist/data/models/therapist_model.dart';
import 'package:moodly/features/therapist/data/services/therapist_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';

class TherapistRepo {
  final TherapistService therapistService;

  TherapistRepo({required this.therapistService});

  Future<Either<Failure, List<TherapistModel>>> getTherapists() async {
    try {
      final List<Map<String, dynamic>> data = await therapistService
          .getTherapists();

      final List<TherapistModel> therapists = data
          .map((e) => TherapistModel.fromJson(e))
          .toList();

      return right(therapists);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
