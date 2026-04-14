import '../models/therapist_model.dart';
import '../services/therapist_service.dart';

class TherapistRepo {
  final TherapistService _therapistService;

  TherapistRepo({required TherapistService therapistService})
    : _therapistService = therapistService;

  Future<List<TherapistModel>> getTherapists() async {
    final List<TherapistModel> therapists = await _therapistService
        .getTherapists();

    return therapists;
  }
}
