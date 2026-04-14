import '../../../../core/functions/user_data_local.dart';
import '../../../auth/data/services/supabase_auth_service.dart';

class SettingsRepo {
  final SupabaseAuthService _supabaseAuthService;

  SettingsRepo({required SupabaseAuthService supabaseAuthService})
    : _supabaseAuthService = supabaseAuthService;

  Future<void> logout() async {
    await _supabaseAuthService.logout();
    await removeUserDataLocal();
  }

  Future<void> resetPassword({required String newPassword}) async {
    await _supabaseAuthService.updateUserProfile(password: newPassword);
    await _supabaseAuthService.logout();
  }
}
