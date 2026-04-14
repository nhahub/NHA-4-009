import '../models/time_slot_model.dart';
import '../services/availability_service.dart';

class AvailabilityRepo {
  final AvailabilityService _availabilityService;

  AvailabilityRepo({required AvailabilityService availabilityService})
    : _availabilityService = availabilityService;

  Future<Map<int, List<TimeSlotModel>>> getTimeSlots({
    required String therapistId,
  }) async {
    final Map<int, List<TimeSlotModel>> slotsByDay = await _availabilityService
        .getTimeSlots(therapistId: therapistId);
    return slotsByDay;
  }
}
