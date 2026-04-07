import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/models/user_data_model.dart';
import 'package:moodly/core/services/supabase_crud_service.dart';

class UserDataService {
  final SupabaseCRUDService supabaseCRUDService;

  UserDataService({required this.supabaseCRUDService});

  Future<UserDataModel> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    final Map<String, dynamic> userData = await supabaseCRUDService
        .upsertDataAndReturnRow(
          table: kUserDataTable,
          data: userDataModel.toJson(),
          onConflict: 'id',
        );
    return UserDataModel.fromJson(userData);
  }

  Future<void> updateUserFields({
    String? name,
    String? phone,
    String? picture,
    bool? isOldUser,
  }) async {
    await supabaseCRUDService.updateData(
      table: kUserDataTable,
      data: {
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (picture != null) 'picture': picture,
        if (isOldUser != null) 'is_old_user': isOldUser,
      },
      idColumn: 'id',
      idValue: supabaseCRUDService.getCurrentUserId(),
    );
  }

  Future<UserDataModel?> getUserData() async {
    final Map<String, dynamic>? userData = await supabaseCRUDService
        .getSingleRow(
          table: kUserDataTable,
          whereColumn: "id",
          whereValue: supabaseCRUDService.getCurrentUserId(),
        );

    return UserDataModel?.fromJson(userData!);
  }

  Future<bool> isUserExists() async {
    final bool response = await supabaseCRUDService.isRowExists(
      table: kUserDataTable,
      column: "id",
      value: supabaseCRUDService.getCurrentUserId(),
    );
    return response;
  }
}
