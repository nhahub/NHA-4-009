import '../../../../core/services/supabase_crud_service.dart';
import '../models/therapist_model.dart';

class TherapistService {
  final SupabaseCRUDService _supabaseCRUDService;
  TherapistService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  // Future<List<TherapistModel>> getTherapists() async {
  //   final data = await supabaseCRUDService._client
  //       .from('therapists_with_rating')
  //       .select();

  //   return (data as List)
  //       .map((row) => TherapistModel.fromJson(row as Map<String, dynamic>))
  //       .toList();
  // }

  Future<List<TherapistModel>> getTherapists() async {
    final data = await _supabaseCRUDService.getData(
      table: 'therapists_with_rating',
    );

    return data.map((e) => TherapistModel.fromJson(e)).toList();
  }
}
