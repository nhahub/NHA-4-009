import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';

class TherapistService {
  final SupabaseCRUDService supabaseCRUDService;
  TherapistService({required this.supabaseCRUDService});

  Future<List<Map<String, dynamic>>> getTherapists() async {
    final data = await supabaseCRUDService.getData(
      table: kTherapistsTable,
      orderBy: 'created_at',
      ascending: false,
    );
    return data.isNotEmpty ? data : [];
  }
}
